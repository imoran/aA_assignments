require_relative 'question_pairs'
require_relative 'user'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class Question
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question_id = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(question_id.first)
  end

  attr_accessor :title, :user_id, :body
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
    @id = options['id']
  end

  def self.find_by_user_id(user_id)
    user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    Question.new(user.first)
  end

  def user
    question_id = self.user_id
    user = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(user.first)
  end

  def replies
    Reply.find_by_question_id(self.id)
  end





end
