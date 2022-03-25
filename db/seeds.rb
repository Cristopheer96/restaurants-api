# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(email: 'john@rambo.com')
user.password = 'password'
user.password_confirmation = 'password'
user.save
p " error #{user.errors} "

restaurant = user.restaurants.create(name: 'Bellagamba', address:"avenida Lima")
restaurant2 = user.restaurants.create(name: 'Siete sopas', address:"Calle 212")
restaurant3 = user.restaurants.create(name: 'Polleria', address:"avenida Arequipa")

user2 = User.new(email: 'jhonwick@rambo.com')
user2.password = 'password'
user2.password_confirmation = 'password'
user2.save

restaurant = user2.restaurants.create(name: 'La francisca', address:"avenida union 2")
