json.extract! award, :id, :raffle_id, :description, :placing, :ticket_id, :created_at, :updated_at
json.url award_url(award, format: :json)
