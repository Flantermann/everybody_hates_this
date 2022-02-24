# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
# require "faker"
# puts "cleaning database"
# Mission.destroy_all
# User.destroy_all
# puts "creating user"

# # generate 20 users
# (1..20).each do |id|
#     User.create!(
#         email: Faker::Internet.email,
#         password: "123456",
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         nickname: Faker::Name.initials,
#         address: Faker::Address.full_address,
#         age: Faker::Number.between(from: 21, to: 77),
#         about_me: Faker::Hipster.sentence(word_count: 20)
#     )
# end

# puts "#{User.count} useres were created"

# # generate 20 Issues
# (1..20).each do |id|
#     Mission.create!(
#         title: Faker::Hipster.sentence(word_count: 3),
#         description: Faker::Hipster.sentence(word_count: 20),
#         category: rand(0..5),
#         timeframe: rand(0..4),
#         prefered_buddy_location: rand(0..2),
#         user: User.all.sample,
#         prefered_buddy_age_start: Faker::Number.between(from: 21, to: 35),
#         prefered_buddy_age_end: Faker::Number.between(from: 36, to: 77)
#     )
# end

# puts "#{Mission.count} missions were created"

# # rails db:seed

# 10 credible seeds are here:

require 'csv'

User.destroy_all
Mission.destroy_all

puts "creating USERS, working on it..."

CSV.foreach(Rails.root.join('lib/seeds/Users.csv'), headers: true) do |row|
  User.create!( {
    #id: row['id'],
    first_name: row['first_name'],
    last_name: row['last_name'],
    nickname: row['nickname'],
    about_me: row['about_me'],
    age: row['age'],
    address: row['address'],
    email: row['email'],
    password: row['password']
  } )
end

puts "#{User.count} rows were created"
User.all
# Missions

puts "Creating MISSIONS, working on it..."
id = User.all[0].id
puts id
CSV.foreach(Rails.root.join('lib/seeds/Missions.csv'), headers: true) do |row|
  Mission.create!( {
    #id: row['id'],
    title: row['title'],
    description: row['description'],
    category: row['category'].to_i,
    timeframe: row['timeframe'].to_i,
    prefered_buddy_location: row['prefered_buddy_location'].to_i,
    prefered_buddy_age_start: row['prefered_buddy_age_start'].to_i,
    prefered_buddy_age_end: row['prefered_buddy_age_end'].to_i,
    user_id: id,
    finished?: row['finished'] == "false"
  } )
  id += 1
  puts id
end

puts "#{Mission.count} rows were created"
