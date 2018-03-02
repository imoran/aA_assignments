# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = ['Ross', 'Joey', 'Chandler', 'Monica', 'Rachel', 'Phoebe']

users.each do |user|
  User.create!(username: user)
end


polls = ['Favorite TV Show', 'Favorite Characters', 'Favorite Food', 'Favorite Color']

polls.each do |poll|
  Poll.create!(title: poll, user_id: User.find_by(username: users.sample).id)
end


questions = ['What is your favorite TV show?', 'Who is your favorite character?', 'What is your favorite food?', 'What is your favorite color?']

questions.each_with_index do |question, idx|
  Question.create!(poll_id: Poll.find_by(title: polls[idx]).id, inquiry: questions[idx])
end


answer_choices_1 = ['Friends', 'Sons of Anarchy', 'Breaking Bad', 'Black Mirror']
answer_choices_2 = ['Mickey Mouse', 'Walter White', 'Jax', 'Rachel Green']
answer_choices_3 = ['Sushi', 'Acai Bowls', 'Falafels', 'Noodles']
answer_choices_4 = ['Neon Green', 'Indigo', 'Baby Blue', 'Black']

answer_choices_1.each do |choice|
  AnswerChoice.create!(question_id: Question.find_by(inquiry: questions[0]).id, selection: choice)
end

answer_choices_2.each do |choice|
  AnswerChoice.create!(question_id: Question.find_by(inquiry: questions[1]).id, selection: choice)
end

answer_choices_3.each do |choice|
  AnswerChoice.create!(question_id: Question.find_by(inquiry: questions[2]).id, selection: choice)
end

answer_choices_4.each do |choice|
  AnswerChoice.create!(question_id: Question.find_by(inquiry: questions[3]).id, selection: choice)
end
