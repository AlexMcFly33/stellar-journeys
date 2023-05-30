require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Removing all datas !!"
Spaceship.destroy_all
User.destroy_all

puts "Crezting new datas !!"

user = User.new(first_name: "Dark", last_name: "Vador", email: "vador_du_33@sith-order.com", password: "anakinthechosenone")
user.save!

puts "1st ship"
spaceship = Spaceship.new(name: "Death Star", superficy: 600, gravity: true, localisation: Faker::Space.constellation, number_of_guest: 20, price: 2500, user: user)
spaceship.save!

puts "2nd ship"
spaceship = Spaceship.new(name: "International Space Station", superficy: 400, gravity: false, localisation: "Around the Earth", number_of_guest: 7, price: 1000, user: user)
spaceship.save!

puts "3rd ship"
spaceship = Spaceship.new(name: "ISV Venture Star", superficy: 1000, gravity: true, localisation: Faker::Space.constellation, number_of_guest: 50, price: 5500, user: user)
spaceship.save!

puts "4th ship"
spaceship = Spaceship.new(name: "Millenium Falcon", superficy: 800, gravity: false, localisation: Faker::Space.constellation, number_of_guest: 40, price: 4000, user: user)
spaceship.save!

puts "5th ship"
spaceship = Spaceship.new(name: "Battlestar Galactica", superficy: 350, gravity: true, localisation: Faker::Space.constellation, number_of_guest: 20, price: 1200, user: user)
spaceship.save!
