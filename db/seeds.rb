# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  email = Faker::Internet.email
  password = Faker::Internet.password
  user = User.create!(email: email, password: password)
  100.times do
    title = Faker::Hipster.sentence(word_count: 3)
    body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
    todo = Todo.create!(title: title, body: body, user_id: user.id)
    100.times do
      body_comment = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
      Comment.create!(body: body_comment, user_id: user.id, todo_id: todo.id)
    end
  end
end
