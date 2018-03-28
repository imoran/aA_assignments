# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all

Todo.create!(title: 'watch TV', body: 'with chips & soda', done: false)
Todo.create!(title: 'read JS book', body: 'when I have free time..never', done: false)
