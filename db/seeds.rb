# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hotel = Category.where(name: "Hotel").first_or_create(name: "Hotel")
restaurant = Category.where(name: "Restaurant").first_or_create(name: "Restaurant")
cafe = Category.where(name: "Cafe").first_or_create(name: "Cafe")
bar = Category.where(name: "Bar").first_or_create(name: "Bar")
pub = Category.where(name: "Pub").first_or_create(name: "Pub")
club = Category.where(name: "Club").first_or_create(name: "Club")
store = Category.where(name: "Store").first_or_create(name: "Store")
theatre = Category.where(name: "Theatre").first_or_create(name: "Theatre")

Place.where(name: "Taco Bell").first_or_create(name: "Taco Bell", description: "tacos", city: "saint paul", state: "mn", category_id: restaurant.id)

Place.where(name: "Park Inn").first_or_create(name: "Park Inn", description: "sleep", city: "los angeles", state: "ca", category_id: hotel.id)

Place.where(name: "Wave").first_or_create(name: "Wave", description: "coffee", city: "miami", state: "fl", category_id: cafe.id)

Place.where(name: "Drink").first_or_create(name: "Drink", description: "beer", city: "new york", state: "ny", category_id: bar.id)

Place.where(name: "Irish Pub").first_or_create(name: "Irish Pub", description: "pale ale", city: "new york", state: "ny", category_id: pub.id)

Place.where(name: "Studio 54").first_or_create(name: "Studio 54", description: "snow", city: "new york", state: "ny", category_id: club.id)

Place.where(name: "BestBuy").first_or_create(name: "BestBuy", description: "electronic", city: "new york", state: "ny", category_id: store.id)

Place.where(name: "Madison Square Garden").first_or_create(name: "Madison Square Garden", description: "musical", city: "new york", state: "ny", category_id: theatre.id)