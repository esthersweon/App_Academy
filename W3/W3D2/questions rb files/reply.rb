require_relative 'database'
require_relative 'user'
require_relative 'question'
require 'sqlite3'


class Reply
  def self.all
    results = QuestionsDatabase.execute("SELECT * FROM replies")
    results.map { |result| Reply.new(result) }
  end

  attr_accessor :id, :question_id, :user_id, :body, :parent_reply_id

  def initialize(options = {})
    @id = options["id"]
    @question_id = options["question_id"]
    @user_id = options["user_id"]
    @body = options["body"]
    @parent_reply_id = options["parent_reply_id"]
  end

  def self.create(question_id, user_id, body, parent_reply_id)
    raise "already saved in database" unless self.id.nil?

    QuestionsDatabase.execute(<<-SQL, question_id, user_id, body, parent_reply_id)
      INSERT INTO
        questions (question_id, user_id, body, parent_reply_id)
      VALUES
        (?, ?, ?, ?)
    SQL

    @id = QuestionsDatabase.last_insert_row_id
  end

  def self.find_by_id(id_num)
    results = QuestionsDatabase.execute(<<-SQL, id_num)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.id = ?
    SQL

    Reply.new(results.first)
  end

  def self.find_by_question_id(question_id_num)
    results = QuestionsDatabase.execute(<<-SQL, question_id_num)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.question_id = ?
    SQL

    results.map{ |result| Reply.new(result) }
  end

  def self.find_by_user_id(user_id_num)
    results = QuestionsDatabase.execute(<<-SQL, user_id_num)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.user_id = ?
    SQL

    results.map{ |result| Reply.new(result) }
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

    Reply.new(results.first)
  end

  def question
    results = QuestionsDatabase.execute(<<-SQL, self.question_id)
      SELECT
        questions.*
      FROM
        questions
      WHERE
        questions.id = ?
    SQL

    Reply.new(results.first)
  end

  def parent_reply
    results = QuestionsDatabase.execute(<<-SQL, self.parent_reply_id)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.id = ?
    SQL

    Reply.new(results.first)
  end

  def child_replies
    results = QuestionsDatabase.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.parent_reply_id = ?
    SQL

    results.map{ |result| Reply.new(result) }
  end


end