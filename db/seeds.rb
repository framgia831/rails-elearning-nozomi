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

#   20.times do |t|
#   title  = "TEST-#{t+1}"
#   description = "This is test category."
#   Category.create!(title:  title,
#                description: description
#                )
# end

Category.create(
      title: "Basic noun 30", 
      description: "This is test category. 30 basically words are registered in this category. Please try this at first.")

Category.create(
      title: "Basic verb 60", 
      description: "This is test category. 60 basically words are registered in this category. Please try this at second.")

Category.create(
      title: "Advanced noun 30", 
      description: "This is test category. 30 words advanced words are registered in this category. Please try this after the bacical categories.")

Category.create(
      title: "Advanced verb 60", 
      description: "This is test category. 60 words advanced words are registered in this category. Please try this after the bacical categories.")



Word.create(
      content: "Printemps", 
      category_id: "1")

Word.create(
      content: "Ciel", 
      category_id: "1")

Word.create(
      content: "Vous", 
      category_id: "1")

Word.create(
      content: "Avenir", 
      category_id: "1")

Word.create(
      content: "Lune", 
      category_id: "1")

Word.create(
      content: "Étoile", 
      category_id: "1")

Word.create(
      content: "Bisou", 
      category_id: "1")

Word.create(
      content: "Espoir", 
      category_id: "1")

Word.create(
      content: "Famille", 
      category_id: "1")

Word.create(
      content: "Vérité", 
      category_id: "1")


Choice.create(
      content: "Spring", 
      judge:"1",
      word_id: "1")

Choice.create(
      content: "Summer", 
      judge:"0",
      word_id: "1")

Choice.create(
      content: "Autumn", 
      judge:"0",
      word_id: "1")

Choice.create(
      content: "Winter", 
      judge:"0",
      word_id: "1")

Choice.create(
      content: "Star", 
      judge:"0",
      word_id: "2")

Choice.create(
      content: "Sky", 
      judge:"1",
      word_id: "2")

Choice.create(
      content: "Rainbow", 
      judge:"0",
      word_id: "2")

Choice.create(
      content: "Night", 
      judge:"0",
      word_id: "2")

Choice.create(
      content: "Me", 
      judge:"0",
      word_id: "3")

Choice.create(
      content: "She", 
      judge:"0",
      word_id: "3")

Choice.create(
      content: "You", 
      judge:"1",
      word_id: "3")

Choice.create(
      content: "They", 
      judge:"0",
      word_id: "3")

Choice.create(
      content: "Future", 
      judge:"1",
      word_id: "4")

Choice.create(
      content: "Past", 
      judge:"0",
      word_id: "4")

Choice.create(
      content: "Time", 
      judge:"0",
      word_id: "4")

Choice.create(
      content: "Hour", 
      judge:"0",
      word_id: "4")

Choice.create(
      content: "Sun", 
      judge:"0",
      word_id: "5")

Choice.create(
      content: "Star", 
      judge:"0",
      word_id: "5")

Choice.create(
      content: "Cloud", 
      judge:"0",
      word_id: "5")

Choice.create(
      content: "Moon", 
      judge:"1",
      word_id: "5")

Choice.create(
      content: "Star", 
      judge:"1",
      word_id: "6")

Choice.create(
      content: "Silius", 
      judge:"0",
      word_id: "6")

Choice.create(
      content: "Stage", 
      judge:"0",
      word_id: "6")

Choice.create(
      content: "Strange", 
      judge:"0",
      word_id: "6")

Choice.create(
      content: "Reality", 
      judge:"0",
      word_id: "7")

Choice.create(
      content: "Jewel", 
      judge:"1",
      word_id: "7")

Choice.create(
      content: "Home", 
      judge:"0",
      word_id: "7")

Choice.create(
      content: "Canpany", 
      judge:"0",
      word_id: "7")

Choice.create(
      content: "Saddness", 
      judge:"0",
      word_id: "8")

Choice.create(
      content: "Happiness", 
      judge:"0",
      word_id: "8")

Choice.create(
      content: "Hope", 
      judge:"1",
      word_id: "8")

Choice.create(
      content: "Joy", 
      judge:"0",
      word_id: "8")

Choice.create(
      content: "Farm", 
      judge:"0",
      word_id: "9")

Choice.create(
      content: "Form", 
      judge:"0",
      word_id: "9")

Choice.create(
      content: "Fantasy", 
      judge:"0",
      word_id: "9")

Choice.create(
      content: "Family", 
      judge:"1",
      word_id: "9")

Choice.create(
      content: "True", 
      judge:"1",
      word_id: "10")

Choice.create(
      content: "False", 
      judge:"0",
      word_id: "10")

Choice.create(
      content: "Good", 
      judge:"0",
      word_id: "10")

Choice.create(
      content: "Bad", 
      judge:"0",
      word_id: "10")