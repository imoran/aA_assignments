require_relative 'question_pairs'

class Reply
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    reply_id = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Reply.new(reply_id.first)
  end
  attr_accessor :question_id, :user_id, :body, :parent_id
  attr_reader :id

  def initialize(options)
    @question_id = options['question_id']
    @body = options['body']
    @user_id = options['user_id']
    @id = options['id']
    @parent_id = options['parent_id']
  end

  def self.find_by_user_id(user_id)
    user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    Reply.new(user.first)
  end

  def self.find_by_question_id(question_id)
    user = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    user.map { |u| Reply.new(u)}
  end

  def user
    User.find_by_id(self.user_id)
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.parent_id)
  end

  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    replies.map { |reply| Reply.new(reply) }
  end
end
