# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :string
#  sub_id     :integer
#  author_id  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, presence: true

  belongs_to :author,
  class_name: :User

  # belongs_to :sub

  has_many :links,
  foreign_key: :post_id,
  class_name: :PostSub

  has_many :subs,
  through: :links,
  source: :sub
end
