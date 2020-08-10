# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Creating Users..."
User.destroy_all


u1 = User.create!(
  name:'Ben',
  dob:'17/02/1998',
  sex: 'M',
  age: 22,
  height: 188,
  weight: 100,
  target_weight: 90,
  bio: 'My profile',
  goal: 'Time to lose some weight',
  email: 'ben.l7@hotmail.com',
  password: 'chicken'

)

puts "Created #{ User.count } users:"
