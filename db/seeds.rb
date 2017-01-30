# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.where(name: "Hotel").first_or_create(name: "Hotel")
Category.where(name: "Restaurant").first_or_create(name: "Restaurant")
Category.where(name: "Cafe").first_or_create(name: "Cafe")
Category.where(name: "Bar").first_or_create(name: "Bar")
Category.where(name: "Club").first_or_create(name: "Club")
Category.where(name: "Store").first_or_create(name: "Store")
