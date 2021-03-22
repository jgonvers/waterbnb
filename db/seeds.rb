# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "creating 20 users"
20.times do
  User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: "user",
    age: (18..99).to_a.sample,
    email: Faker::Internet.email,
  ).save!
end

puts "creating 5 owner"
5.times do
  User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: "owner",
    age: (18..99).to_a.sample,
    email: Faker::Internet.email,
  ).save!
end

user_list = User.where(role:"user")
owner_list = User.where(role:"owner")

puts "creating 10 pedalos"
10.times do
  ped = Pedalo.new(
    name: Faker::Mountain.name,
    description: Faker::Hipster.paragraph,
    price_per_hour: (2500..5000).to_a.sample,
    owner: owner_list.sample
  ).save!
end


puts "creating 10 reservations"
n = 0
10.times do
  duration = (1..3).to_a.sample
  ped = Pedalo.all.sample
  date = Time.now
  date += 60*60*24*n
  Reservation.new(
    transaction_price: ped.price_per_hour * duration,
    start_time: date,
    end_time: date + 60*60*duration,
    accepted: "pending",
    user: user_list.sample,
    pedalo: ped,
  ).save!
  n += 1
end
