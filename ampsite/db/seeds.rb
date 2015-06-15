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
AMP_TOPIC = { "Marshall" => "Anything related to Marshall amps",
              "Fender" =>  "Anything related to Fender amps", 
              "Orange / Matamp" => "Anything related to Orange or Matamp amps", 
              "Mesa Boogie" => "Anything related to Mesa Boogie amps", 
              "Ampeg" => "Anything related to Ampeg amps", 
              "Hiwatt" => "Anything related to Hiwatt Amps"}

AMP_TOPIC.each do |amp, desc| 
  Topic.create(title: amp, description: desc)
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

