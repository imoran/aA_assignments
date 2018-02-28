require 'singleton'
require 'byebug'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end
end


class User
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_name(fname, lname)
    full_name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    User.new(full_name.first)
  end

  def self.find_by_id(id)
    user_id = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(user_id.first)
  end

  attr_accessor :fname, :lname
  attr_reader :id

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end
end
