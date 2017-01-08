# This file should contain all the records creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


genres = [
     "Classic",
     "Electronic",
     "Hip Hop",
     "Jazz",
     "Metal",
     "Pop",
     "RnB",
     "Rock",
     "Other"
]

genres.each do |genre|
  Genre.create( genre: genre )
end