require_relative 'database'
require_relative 'user'
require_relative 'reply'
require 'sqlite3'

class Question

  def self.all
    results = QuestionsDatabase.execute("SELECT * FROM questions")
    results.map { |result| Question.new(result) }
  end

  attr_accessor :id, :title, :body, :user_id

  def initialize(options = {})
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @user_id = options["user_id"]
  end

  def self.create(title, body, user_id)
    raise "already saved in database" unless self.id.nil?

    QuestionsDatabase.execute(<<-SQL, title, body, user_id)
      INSERT INTO
        questions(title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL

    @id = QuestionsDatabase.last_insert_row_id
  end

  def self.find_by_id(id_num)
    results = QuestionsDatabase.execute(<<-SQL, id_num)
      SELECT
        questions.*
      FROM
        questions
      WHERE
        questions.id = ?
    SQL

    Question.new(results.first)
  end

  def self.find_by_author_id(user_id)
    results = QuestionsDatabase.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      WHERE
        questions.user_id = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def author
    results = QuestionsDatabase.execute(<<-SQL, self.user_id)
      SELECT
        users.*
      FROM
        users
      WHERE
        users.id = ?
    SQL

    User.new(results.first)
  end

  def replies 
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollower.followers_for_question_id(id)
  end

  def self.most_followed(n)
    QuestionFollower.most_followed_questions(n)
  end

end