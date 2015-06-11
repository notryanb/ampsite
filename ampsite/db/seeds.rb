# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User seeds
require 'faker'

11.times do |user|
  User.create(email: Faker::Internet.free_email ,
              username: Faker::Internet.user_name, 
              password: 'password123' )
end


# Create topics for discussion forum
AMP_TOPIC = [ "Marshall", "Fender", "Orange / Matamp", "Mesa Boogie", "Ampeg", "Hiwatt"]

for topic in AMP_TOPIC
  Topic.create(title: topic)
end

26.times do |post|
  Post.create(title: Faker::Lorem.sentence,
              content: Faker::Lorem.paragraph,
              user_id: [*1..10].sample,
              topic_id: [*1..6].sample)
end

51.times do |post|
  Comment.create(content: Faker::Lorem.paragraph,
                 user_id: [*1..10].sample,
                 post_id: [*1..25].sample)
end

