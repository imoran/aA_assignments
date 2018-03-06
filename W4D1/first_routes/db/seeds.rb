# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

usernames = ["Ian", "Isis", "Ujwal", "Annie", "Jon"]

usernames.each do |username|
  User.create!(username: username)
end
user_ids = User.all.pluck(:id)

artworks = [{ title: 'Mona Lisa', image_url: 'www.google.com' },
            { title: 'Time', image_url: 'www.googly.com' },
            { title: 'The Last Supper', image_url: 'www.github.com' },
            { title: 'Untitled', image_url: 'www.googs.com' }]

artworks.each do |artwork|
  merged_artwork = artwork.merge(artist_id: user_ids.sample)
  Artwork.create!(merged_artwork)
end

artwork_ids = Artwork.all.pluck(:id)

artwork_ids.each do |artwork_id|
  user_ids.sample(2).each do |user_id|
    ArtworkShare.create!(artwork_id: artwork_id, viewer_id: user_id)
  end
end
