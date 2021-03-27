# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Gustavo', email: 'camargo25.gustavo@gmail.com', password: 'senha', admin: false)
Kind.create(description: 'Tipo 1', initial_number: 2, step: 5, number_of_tickets: 100)