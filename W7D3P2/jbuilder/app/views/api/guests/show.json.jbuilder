json.extract! @guest, :name, :age, :favorite_color

json.gifts { json.array! @guest.gifts, :title, :description }
