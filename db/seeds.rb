# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Start seeding..."

Like.destroy_all
Tweet.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('tweets')
ActiveRecord::Base.connection.reset_pk_sequence!('likes')

puts "Seeding users"

admin = User.create(email: "admin@mail.com", username: "@anonymous", name: "Anonymous", password: "qwerty", role: 1)
admin.avatar.attach(io: File.open("app/assets/images/user/anonymous.png"), filename: "anonymous.png")

schopi = User.create(email: "schopi@mail.com", username: "@schopi", name: "Arthur Schopenhauer", password: "qwerty", role: 1)
schopi.avatar.attach(io: File.open('app/assets/images/user/Arthur Schopenhauer.jpg'), filename: 'Arthur Schopenhauer.jpg')

musk = User.create(email: "musk@mail.com", username: "@notmusk", name: "Not Elon Musk", password: "qwerty", role: 0)
musk.avatar.attach(io: File.open('app/assets/images/user/Elon Musk.jpg'), filename: 'Elon Musk.jpg')

margot = User.create(email: "margot@mail.com", username: "@margotrobbie", name: "Margot Robbie", password: "qwerty", role: 1)
margot.avatar.attach(io: File.open('app/assets/images/user/Margot Robbie.jpg'), filename: 'Margot Robbie.jpg')

tony = User.create(email: "tony@mail.com", username: "@tonyhawk", name: "Tony Hawk", password: "qwerty", role: 1)
tony.avatar.attach(io: File.open('app/assets/images/user/Tony Hawk.jpg'), filename: 'Tony Hawk.jpg')

puts "Seeding tweets"

Tweet.create(body: "This is my first tweet.", user_id: 1, likes_count: 25)

Tweet.create(body: "Hello F World.", user_id: 2, likes_count: 20)

Tweet.create(body: "'sup my G's!!", user_id: 3, likes_count: 48)

Tweet.create(body: "Y'all should watch Babylon.", user_id: 4, likes_count: 689)

Tweet.create(body: "Do a kickflip!!", user_id: 5, likes_count: 778)

Tweet.create(body: "You're fired!", user_id: 3, replied_to_id: 1)

Tweet.create(body: "I'm the admin ¬¬", user_id: 1, replied_to_id: 3)

Tweet.create(body: "Cool", user_id: 5, replied_to_id: 1)

Tweet.create(body: "Or a heelflip!", user_id: 4, replied_to_id: 5)

Tweet.create(body: "Haha F world...", user_id: 1, replied_to_id: 2)

puts "Seeding process finished"
