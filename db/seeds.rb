# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'pry'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Post.destroy_all
User.destroy_all
Comment.destroy_all

puts "Creating users..."
user1 = User.create(username: Faker::Name.first_name, password: "password")
user2 = User.create(username: Faker::Name.first_name, password: "password")
user3 = User.create(username: "miketran", password: "password")


puts "Creating posts..."
p1 = Post.create(description: Faker::Lorem.sentence, likes: 5, user: user3)
p2 = Post.create(description: Faker::Lorem.sentence, likes: 5, user: user3)
p3 = Post.create(description: Faker::Lorem.sentence, likes: 5, user: user3)

puts "Creating comments..."
c1 = Comment.create(likes: 3, comment: Faker::Lorem.sentence, post: p1)
c2 = Comment.create(likes: 4, comment: Faker::Lorem.sentence, post: p1)
c3 = Comment.create(likes: 5, comment: Faker::Lorem.sentence, post: p1)

puts "Creating followers..."
f1 = UserFollower.create(user_id: user1.id, follower_id: user2.id)

puts "Seeding done!"
binding.pry