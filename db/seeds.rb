# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts " start"
10.times do |i|
  user_name = Faker::Internet.username(specifier: 5..8)
  user = User.new
  user.email = Faker::Internet.email(name: user_name)
  user.password = "password"
  user.name = user_name
  user.age = [*16..50].sample
  user.gender = [0,1].sample
  user.user_level = 0
  user.mobile = Faker::PhoneNumber.cell_phone
  user.save!
end
puts "done"