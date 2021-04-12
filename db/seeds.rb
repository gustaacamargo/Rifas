# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    Kind.create(description: Faker::Job.unique.field, initial_number: Faker::Number.between(from: 1, to: 5), step: Faker::Number.between(from: 1, to: 10), number_of_tickets: Faker::Number.number(digits: 3))
end

10.times do
    User.create(
        email: Faker::Internet.unique.email, 
        name: Faker::Movies::StarWars.unique.character, 
        password: 'Senha123', 
        password_confirmation: 'Senha123'
    )
end

10.times do 
    raffle = Raffle.create(
        title: Faker::Name.unique.middle_name, 
        description: Faker::Lorem.sentence(word_count: 5), 
        probable_raffle_date: Faker::Date.between(from: 5.days.ago, to: Date.today),
        start_date_sale: Faker::Date.between(from: 5.days.ago, to: Date.today),
        end_date_sale: Faker::Date.between(from: 5.days.ago, to: Date.today),
        ticket_value: Faker::Number.decimal(l_digits: 2),
        user: User.all.sample,
        kind: Kind.all.sample,
    )

    1000.times do |index|
        Ticket.create(
            raffle: raffle,
            number: index + 1,
        )
    end

    5.times do |index|
        award = Award.create(
            raffle: raffle,
            description: Faker::Lorem.sentence(word_count: 5),
            placing: index + 1,
        )

        raffle.awards << award
    end
end
