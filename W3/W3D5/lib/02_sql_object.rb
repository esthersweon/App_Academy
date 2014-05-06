require_relative 'db_connection'
require_relative '01_mass_object'
require 'active_support/inflector'

class MassObject
  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end
end

class SQLObject < MassObject

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.table_name=(table_name)
    @table_name = self.table_name
  end

  def attributes
    @attributes ||= {}
  end

  def self.columns
    @columns ||= DBConnection.execute2
      ("SELECT * FROM #{self.table_name}")
      .first.map(&:to_sym)
    
      @columns.each do |name|
        define_method("#{name}") do 
          self.attributes[name]
        end

        define_method("#{name}=") do |value|
          self.attributes[name] = value
        end
      end

  end
  
  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute: #{attr_name}"
      end
    end
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
    #{ table_name }.*
      FROM
    #{ table_name }
    SQL

    parse_all(results)
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
    SELECT
    #{table_name}.*
    FROM
    #{table_name}
    WHERE
    #{table_name}.id = ?
    SQL

    parse_all(results)
  end

  def insert
    col_names = self.class.columns.map(&:to_s).join(", ")
    question_marks = (["?"]*self.class.columns.length).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
    INSERT INTO
    #{self.class.table_name} (#{col_names})
    VALUES
    (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns.map{ |column| column.to_s + " = ?" }
    joined_col_names = col_names.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
    UPDATE
    #{self.class.table_name}
    SET
    #{joined_col_names}
    WHERE
    id = #{self.id}
    SQL
    
  end

  #helping insert and update methods above
  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end


end
