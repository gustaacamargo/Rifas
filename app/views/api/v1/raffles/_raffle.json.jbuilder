json.array! raffle.awards do |award|
    json.extract! raffle, :date_raffle
    json.extract! award, :description, :id
    json.extract! award.ticket, :number
    json.extract! award.ticket.user, :name
end
