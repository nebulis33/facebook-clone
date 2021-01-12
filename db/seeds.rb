# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
User.create(name: "John", email: "john@web.com", password: "foobar")
User.create(name: "Sarah", email: "sarah@web.com", password: "foobar")
User.create(name: "Shane", email: "shane@web.com", password: "foobar")

# Create posts
Post.create(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
    Proin ac purus metus. Mauris sem quam, suscipit ac blandit ut, laoreet non quam. 
    Sed feugiat, nunc vel convallis semper, leo felis facilisis velit, vel euismod velit lectus in mi. 
    Pellentesque porttitor enim ac dolor ornare venenatis. Nulla sit amet facilisis ex. Curabitur ut viverra nisl.",
    user_id: 1)

# Create comments
Comment.create(content: "This is just a comment", user_id: 1, post_id: 1)