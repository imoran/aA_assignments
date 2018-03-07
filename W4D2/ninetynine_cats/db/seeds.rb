# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
cat1 = Cat.create!(name: 'midnight',birth_date: '2005/01/20', color: 'black', sex: 'M', description: 'Cute')
cat2 = Cat.create!(name: 'Cutton',birth_date: '2008/02/10', color: 'white', sex: 'F', description: 'Fluffy')
