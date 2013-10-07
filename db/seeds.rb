# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  new_post = Post.create(title: Faker::Company.bs.capitalize, content: Faker::Lorem.paragraphs.join("\n"))

  rand(5..14).times do
    new_post.comments.build(commenter: Faker::Name.first_name, body: Faker::Lorem.sentence(12)).save
  end

end