# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.delete_all
Link.delete_all
Vote.delete_all
Comment.delete_all

User.create!(name: "Super", email: "super_user@redditlikeclone.com",
            password: 'passw0rd', password_confirmation: 'passw0rd', admin: true)

5.times do |n|
  name = FFaker::Name.first_name
  email = FFaker::Internet.email
  password = 'passw0rd'
  password_confirmation = 'passw0rd'

  User.create!(name: name, email: email, password: password,
              password_confirmation: password_confirmation)
end

10.times do |n|
  title = FFaker::Company.bs
  url = FFaker::Internet.http_url
  content = FFaker::Lorem.paragraph

  Link.create!(title: title, url: url, content: content, user_id: rand(1..6))
end

users = User.all

40.times do |n|
  body = FFaker::Lorem.sentence(2)
  users.each do |user|
    Comment.create(author: user.name, body: body, link_id: rand(1..10), user_id: user.id)
  end
end

100.times do |n|
  Vote.create!(value: 1, link_id: rand(1..10), user_id: rand(1..6))
end

50.times do |n|
  Vote.create!(value: -1, link_id: rand(1..10), user_id: rand(1..6))
end
