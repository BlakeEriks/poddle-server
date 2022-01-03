# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: "blake", password: "pineapple")

Genre.create(api_id: 144, name: "Personal Finance")
Genre.create(api_id: 151, name: "Locally Focused")
Genre.create(api_id: 168, name: "Fiction")
Genre.create(api_id: 88, name: "Health & Fitness")
Genre.create(api_id: 132, name: "Kids & Family")
Genre.create(api_id: 77, name: "Sports")
Genre.create(api_id: 125, name: "History")
Genre.create(api_id: 127, name: "Technology")
Genre.create(api_id: 134, name: "Music")
Genre.create(api_id: 69, name: "Religion & Spirituality")
Genre.create(api_id: 107, name: "Science")
Genre.create(api_id: 133, name: "Comedy")
Genre.create(api_id: 111, name: "Education")
Genre.create(api_id: 117, name: "Government")
Genre.create(api_id: 122, name: "Society & Culture")
Genre.create(api_id: 93, name: "Business")
Genre.create(api_id: 99, name: "News")
Genre.create(api_id: 82, name: "Leisure")
Genre.create(api_id: 68, name: "TV & Film")
Genre.create(api_id: 100, name: "Arts")
Genre.create(api_id: 135, name: "True Crime")