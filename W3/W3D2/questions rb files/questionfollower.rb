require_relative 'database'
require_relative 'user'
require_relative 'reply'
require_relative 'question'
require 'sqlite3'

class QuestionFollower
  def self.all
    results = QuestionsDatabase.execute("SELECT * FROM question_followers")
    results.map { |result| User.new(result) }
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
        question_followers (user_id, question_id)
      VALUES
        (?, ?)
    SQL

    @id = QuestionsDatabase.last_insert_row_id
  end

  def self.find_by_id(id_num)
    results = QuestionsDatabase.execute(<<-SQL, id_num)
      SELECT
        question_followers.*
      FROM
        question_followers
      WHERE
        question_followers.id = ?
    SQL

    QuestionFollower.new(results.first)
  end

  def self.followers_for_question_id(question_id)
    results = QuestionsDatabase.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_followers
      ON
        users.id = question_followers.user_id
      WHERE
        question_followers.question_id = ?
    SQL

    results.map { |result| User.new(result) }
  end

  def self.followed_questions_for_user_id(user_id)
    results = QuestionsDatabase.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_followers
      ON
        questions.id = question_followers.question_id
      WHERE
        question_followers.user_id = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def self.most_followed_questions(n)
    results = QuestionsDatabase.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_followers
      ON
        questions.id = question_followers.question_id
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL

    results.map { |result| Question.new(result)}
  end

end

