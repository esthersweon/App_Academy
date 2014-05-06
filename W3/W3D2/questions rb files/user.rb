require_relative 'database'
require_relative 'question'
require_relative 'questionfollower'
require_relative 'reply'
require 'sqlite3'

class User

  def self.find_by_id(id_num)
    results = QuestionsDatabase.execute(<<-SQL, id_num)
      SELECT
        users.*
      FROM
        users
      WHERE
        users.id = ?
    SQL

    results.first.nil? ? nil : User.new(results.first)
  end

  def self.find_by_name(first, last)
    results = QuestionsDatabase.execute(<<-SQL, first, last)
      SELECT
        *
      FROM
        users
      WHERE
        users.fname = ? AND users.lname = ?
    SQL

    results.first.nil? ? nil : User.new(results.first)
  end

  def self.all
    results = QuestionsDatabase.execute("SELECT * FROM users")
    results.map { |result| User.new(result) }
  end

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(options = {})
    @id = options["id"]
    @fname = options["fname"]
    @lname = options["lname"]
  end

  def save
    if @id
      QuestionsDatabase.execute(<<-SQL, fname, lname)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          users.id = self.id
      SQL
    else
      QuestionsDatabase.execute(<<-SQL, fname, lname)
        INSERT INTO
          users (fname, lname)
        VALUES
          (?, ?)
      SQL

      @id = QuestionsDatabase.last_insert_row_id
    end
    self
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollower.followed_questions_for_user_id(self.id)
  end
end