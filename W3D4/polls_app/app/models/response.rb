# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  validates_presence_of :user_id, :answer_id

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_id

  belongs_to :respondent,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses
      .where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.each do |response|
      return true if response.exists?(user_id: self.id)
    end

    false
  end

  def duplicate_response
    if respondent_already_answered?
      errors[:duplicate] << 'This user has already answered.'
    end
  end
end
