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
Post.create(body: "baby kale chips raclette scenester disrupt blue bottle vice. 
    Cray celiac shaman jianbing. 
    Hot chicken forage vice bespoke 3 wolf moon lumbersexual kombucha chicharrones PBR&B viral chartreuse vape ugh scenester YOLO. 
    XOXO everyday carry seitan pug, glossier farm-to-table 3 wolf moon disrupt slow-carb hashtag twee yuccie asymmetrical meh. 
    Seitan waistcoat bitters echo park photo booth migas pabst. 
    Af quinoa next level artisan craft beer fashion axe.",
    user_id: 1)
Post.create(body: "Nulla sed metus eros. Vivamus eget eleifend arcu. Sed ut ultricies nisi. Donec nunc nisl, ultrices in tincidunt vel, sagittis eget ex. 
    Vivamus feugiat felis est, sit amet ornare tortor fringilla id.
    Hot chicken forage vice bespoke 3 wolf moon lumbersexual kombucha chicharrones PBR&B viral chartreuse vape ugh scenester YOLO. 
    XOXO everyday carry seitan pug, glossier farm-to-table 3 wolf moon disrupt slow-carb hashtag twee yuccie asymmetrical meh. 
    Seitan waistcoat bitters echo park photo booth migas pabst. 
    Af quinoa next level artisan craft beer fashion axe.",
    user_id: 2)

# Create comments
Comment.create(content: "This is just a comment", user_id: 1, post_id: 1)
Comment.create(content: "This is yet another comment by another user", user_id: 2, post_id: 1)

# Create friendships
Friendship.create(requestor_id: 1, requestee_id: 2, status: true)