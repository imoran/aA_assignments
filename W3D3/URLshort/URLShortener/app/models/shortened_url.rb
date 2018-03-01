require 'user'
require 'securerandom'

class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :visited_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitors

  def self.random_code
    code = SecureRandom.urlsafe_base64

    while self.exists?(code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end

  def self.generate_short_url(user, long_url)
    new_url = ShortenedUrl.new(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
    new_url.save!
  end

  def num_clicks
    self.visits.select(:visitor_id).count
  end

  def num_uniques
    self.visits.select(:visitor_id).distinct.count
  end

  def num_recent_updates

  end

end
