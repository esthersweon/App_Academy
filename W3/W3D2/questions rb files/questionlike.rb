require_relative 'database'
require_relative 'user'
require_relative 'reply'
require_relative 'question'
require_relative 'questionfollower'
require 'sqlite3'

class QuestionLike
  def self.all
    results = QuestionsDatabase.execute("SELECT * FROM question_likes")
    results.map { |result| QuestionLike.new(result) }
  end

  attr_accessor :id, :user_id, :question_id

  def initialize(options = {})
    @id = options["id"]
    @user_id = options["user_id"]
    @question_id = options["question_id"]
  end

  def self.create(user_id, question_id)
    raise "already saved in database" unless self.id.nil?

    QuestionsDatabase.execute(<<-SQL, user_id, question_id)
      INSERT INTO
        question_likes (user_id, question_id)
      VALUES
        (?, ?)
    SQL

    @id = QuestionsDatabase.last_insert_row_id
  end

  def self.find_by_id(id_num)
    results = QuestionsDatabase.execute(<<-SQL, id_num)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_likes.id = ?
    SQL

    QuestionLike.new(results.first)
  end

  def self.likers_for_question_id(question_id)
    results = QuestionsDatabase.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_likes
      ON
        question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?
    SQL

    results.map{ |result| User.new(result) }
  end

  def self.num_likes_for_question_id(question_id)
    results = QuestionsDatabase.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        questions
      JOIN
        question_likes
      ON
        question_likes.question_id = questions.id
      WHERE
        questions.id = ?
    SQL

    results.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes
      ON
        question_likes.question_id = questions.id
      WHERE
        question_likes.user_id = ?
    SQL

    results.map{ |result| Question.new(result) }
  end
end