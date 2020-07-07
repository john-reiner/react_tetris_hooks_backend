# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'Luke', password: 'skywalker')
Score.create(user_id: 1, score: 234, rows: 4324, level: 7)
Score.create(user_id: 1, score: 345, rows: 4567, level: 78)
Score.create(user_id: 1, score: 456, rows: 7689, level: 756)