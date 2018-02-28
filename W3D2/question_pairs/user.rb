require_relative 'question_pairs'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'question'


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

  def authored_questions
    questions = Question.find_by_user_id(self.id)
    authors = QuestionsDatabase.instance.execute(<<-SQL, questions.id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    authors.map { |author| Question.new(author) }
  end

  def authored_replies
    replies = Reply.find_by_user_id(self.id)
    authors = QuestionsDatabase.instance.execute(<<-SQL, replies.id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    authors.map { |author| Reply.new(author) }
  end

  attr_accessor :fname, :lname
  attr_reader :id

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end
end
