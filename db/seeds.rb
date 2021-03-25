# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

puts "creating 1 user of each role with role@role.com"
user1 = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '1234567',
    password_confirmation: '1234567',
    age: (18..99).to_a.sample,
    email: "customer@customer.com",
  )
user1.save!
file = URI.open('https://static1.purepeople.com/articles/9/25/48/9/@/174992-tom-cruise-624x600-2.jpg')
user1.photo.attach(io: file, filename: 'tom.jpg', content_type: 'image/jpg')

user2 = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '1234567',
    role: 'owner',
    password_confirmation: '1234567',
    age: (18..99).to_a.sample,
    email: "owner@owner.com",
  )
file = URI.open('https://i.pinimg.com/originals/18/64/13/186413a2093d0f5ee331075dc44e99e2.jpg')
user2.save!
user2.photo.attach(io: file, filename: 'leo.jpg', content_type: 'image/jpg')

user3 = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '1234567',
    role: 'admin',
    password_confirmation: '1234567',
    age: (18..99).to_a.sample,
    email: "admin@admin.com",
  )
file = URI.open('https://resize-elle.ladmedia.fr/r/625,,forcex/crop/625,625,center-middle,forcex,ffffff/img/var/plain_site/storage/images/loisirs/series/friends-aviez-vous-remarque-ce-tic-de-jennifer-aniston-dans-la-serie-3910021/94497821-1-fre-FR/Friends-aviez-vous-remarque-ce-tic-de-Jennifer-Aniston-dans-la-serie.jpg')
user3.save!
user3.photo.attach(io: file, filename: 'jen.jpg', content_type: 'image/jpg')

puts "creating 20 users"
20.times do
user1 = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '1234567',
    password_confirmation: '1234567',
    age: (18..99).to_a.sample,
    email: Faker::Internet.email,
  )
user1.save!
file = URI.open('https://img-3.journaldesfemmes.fr/G1LUJ_g3q2BmFnUBPTPw0-FnMJc=/910x607/smart/22f33f5d9a824e66abcc5454d71bec2a/ccmcms-jdf/17241418.jpg')
user1.photo.attach(io: file, filename: 'claude.jpg', content_type: 'image/jpg')
end


puts "creating 5 owner"
5.times do
user1 = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '1234567',
    role: 'owner',
    password_confirmation: '1234567',
    age: (18..99).to_a.sample,
    email: Faker::Internet.email,
  )
user1.save!
file = URI.open('https://img-3.journaldesfemmes.fr/G1LUJ_g3q2BmFnUBPTPw0-FnMJc=/910x607/smart/22f33f5d9a824e66abcc5454d71bec2a/ccmcms-jdf/17241418.jpg')
user1.photo.attach(io: file, filename: 'claude.jpg', content_type: 'image/jpg')
end


user_list = User.where(role:"client")
owner_list = User.where(role:"owner")

puts "creating Unsinkable II"

unsinkable = Pedalo.new(
  name: "Unsinkable II",
  description: "This mighty boat will never sink (again).",
  price_per_hour: (2500..5000).to_a.sample,
  address: 'Avenue Général Guisan 121b, 1009 Pully, Switzerland',
  owner: User.where(email:"owner@owner.com").first,
  location: ['Lausanne', 'Genève', 'Montreux', 'Vevey'].sample,
  image_link: "pedalos_images/6.jpg",
)
unsinkable.save!
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/12/86/e0/79/pedalo-fun.jpg')
unsinkable.photo.attach(io: file, filename: 'unsinkable.jpg', content_type: 'image/jpg')

puts "creating 10 pedalos"
10.times do
  pedalo1 = Pedalo.new(
      name: Faker::Mountain.name,
      description: Faker::Hipster.paragraph,
      address: ['Club Nautique Morgien, Place de la Navigation, 1110 Morges, Switzerland', 'Rue du Pont-Levis 5, 1162 Saint-Prex, Switzerland', 'Chemin du Riau 4a, 1162 Saint-Prex, Switzerland', 'Route de la Plage, 1165 Allaman, Switzerland', 'Route du Pralet 8, 1195 Dully, Switzerland', 'Rue de la Colombière 9, 1260 Nyon, Switzerland', 'Route du Port 4, 1009 Pully, Switzerland', 'Avenue Général Guisan 121b, 1009 Pully, Switzerland', 'Avenue de Rhodanie 15, 1007 Lausanne, Switzerland', 'Avenue Emile-Henri-Jaques-Dalcroze, 1007 Lausanne, Switzerland', 'Chemin des Brunette, 1091 Bourg-en-Lavaux, Switzerland', 'Grand-Rue 44, 1095 Lutry, Switzerland', 'Avenue Emile-Henri-Jaques-Dalcroze, 1007 Lausanne, Switzerland', 'Chemin de Chamblandes 32, 1009 Pully, Switzerland', 'Chemin de la Pouponnière 4, 1822 Montreux, Switzerland', 'Pourquoi Aller Plus Loin, Avenue de Chillon, 1823 Montreux, Switzerland'].sample,
      price_per_hour: (2500..5000).to_a.sample,
      owner: owner_list.sample,
      location: ['Lausanne', 'Genève', 'Montreux', 'Vevey'].sample,
      image_link: "pedalos_images/"+("1".."5").to_a.sample+".jpg",
    )
  pedalo1.save!  
  file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/12/86/e0/79/pedalo-fun.jpg')
  pedalo1.photo.attach(io: file, filename: 'unsinkable.jpg', content_type: 'image/jpg')
end

puts "creating a reservations of the unsinkable"
date = Time.now
ped = Pedalo.where(name:"Unsinkable II").first
Reservation.new(
  transaction_price: ped.price_per_hour,
  start_time: date,
  end_time: date + 3600,
  accepted: "pending",
  user: user_list.sample,
  pedalo: ped,
).save!

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
    end_time: date + 3600*duration,
    accepted: "pending",
    user: user_list.sample,
    pedalo: ped,
  ).save!
  n += 1
end
