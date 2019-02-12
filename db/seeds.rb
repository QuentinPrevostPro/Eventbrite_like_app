# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  join = JoinTableGossipsTag.new
#  gossip = Gossip.all.sample
#  join.gossip = gossip
#  tag = Tag.all.sample
#  join.tag = tag
#  join.save

#Create 5 users
5.times do
User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Lorem.word, descrption: Faker::Lorem.word)
end

#Create 10 events
10.times do
  event = Event.new(start_date: DateTime.now + 1, duration: 10, title: Faker::Lorem.characters(rand(5..140)), description: Faker::Lorem.characters(rand(20..1000)), price: rand(1..1000), location: Faker::Address.city)
  admin = User.all.sample
  event.admin = admin
  event.save
end

#Create 20 attendances
20.times do
  attendance = Attendance.new(stripe_customer_id: Faker::Bank.iban)
  attendee = User.all.sample
  attendance.attendee = attendee
  event = Event.all.sample
  attendance.event = event
  attendance.save
end