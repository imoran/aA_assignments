# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :string
#  moderator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator,
  class_name: :User

  # has_many :posts

  has_many :links,
  foreign_key: :sub_id,
  class_name: :PostSub

  has_many :posts,
  through: :links,
  source: :post
end
