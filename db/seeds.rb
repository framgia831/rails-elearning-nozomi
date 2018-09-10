# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Nozomi Matsuoka", 
			admin: "1",
			email: 'n.matsuoka@gmail.com',
			password: 'nozomi',
			department: "Trans Dept.")

User.create(name: "ai", 
			admin: "0",
			email: 'ai@example.com',
			password: 'ai',
			department: "Development Dept.")

User.create(name: "Jane", 
			admin: "0",
			email: 'jane@example.com',
			password: 'jane',
			department: "Management Dept.")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               admin: "0",
               password:              password,
               password_confirmation: password,
               department: "QA Dept.")
end