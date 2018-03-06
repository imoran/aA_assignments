# == Schema Information
#
# Table name: artworks
#
#  id        :integer          not null, primary key
#  title     :string           not null
#  image_url :text             not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :artist_id, :title, :image_url, presence: true

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  class_name: :ArtworkShare,
  foreign_key: :artwork_id,
  primary_key: :id

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer
end
