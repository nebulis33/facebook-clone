# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
User.create(name: "John", email: "foo@bar.baz", password: "foobar")
User.create(name: "Sarah", email: "sarah@web.com", password: "foobar")
User.create(name: "Shane", email: "shane@web.com", password: "foobar")
User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "foobar")
User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "foobar")
User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "foobar")
User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "foobar")
User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "foobar")
User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "foobar")

# Create posts
Post.create(body: Faker::Lorem.paragraph(sentence_count: 10), user_id: 1)
Post.create(body: Faker::Lorem.paragraph(sentence_count: 5), user_id: 1)
Post.create(body: Faker::Lorem.paragraph(sentence_count: 20), user_id: 2)
Post.create(body: Faker::Lorem.paragraph(sentence_count: 10), user_id: 3)
Post.create(body: Faker::Lorem.paragraph(sentence_count: 5), user_id: 9)
Post.create(body: Faker::Lorem.paragraph(sentence_count: 20), user_id: 1)

# Create comments
Comment.create(content: Faker::Lorem.paragraph(sentence_count: 2), user_id: 1, post_id: 1)
Comment.create(content: Faker::Lorem.paragraph(sentence_count: 3), user_id: 2, post_id: 1)
Comment.create(content: Faker::Lorem.paragraph(sentence_count: 2), user_id: 2, post_id: 1)
Comment.create(content: Faker::Lorem.paragraph(sentence_count: 4), user_id: 1, post_id: 1)
Comment.create(content: Faker::Lorem.paragraph(sentence_count: 2), user_id: 2, post_id: 1)
Comment.create(content: Faker::Lorem.paragraph(sentence_count: 2), user_id: 1, post_id: 1)

# Create friendships
Friendship.create(requestor_id: 1, requestee_id: 2, status: true)
Friendship.create(requestor_id: 1, requestee_id: 3, status: false)
Friendship.create(requestor_id: 1, requestee_id: 4, status: true)
Friendship.create(requestor_id: 1, requestee_id: 5, status: false)
Friendship.create(requestor_id: 6, requestee_id: 1, status: true)
Friendship.create(requestor_id: 7, requestee_id: 1, status: false)