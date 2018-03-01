class Visit < ApplicationRecord
  belongs_to :visited_urls,
    primary_key: :id,
    foreign_key: :visited_url_id,
    class_name: :ShortenedUrl


  belongs_to :visitors,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User

  def self.record_visit!(user, shortened_url)
    visit = Visit.new(visitor_id: user.id, visited_url_id: shortened_url.id)
    visit.save!
  end
end
