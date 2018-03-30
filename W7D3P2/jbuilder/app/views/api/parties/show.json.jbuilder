json.extract! @party, :name, :location

# will return an array
json.guests @party.guests do |guest|
    json.name guest.name
    json.gifts guest.gifts, :title, :description
  end

# will create an object
  # json.guests do
  #   @party.guests.each do |guest|
  #     json.set! guest.id do
  #       json.name guest.name
  #       json.gifts guest.gifts, :title, :description
  #     end
  #   end
  # end


# json.extract! @guest, :name, :age, :favorite_color
#
# json.gifts { json.array! @guest.gifts, :title, :description }
