json.extract! ticket, :id, :raffle_id, :user_id, :number, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
