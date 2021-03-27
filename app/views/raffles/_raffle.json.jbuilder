json.extract! raffle, :id, :user_id, :kind_id, :title, :description, :probable_raffle_date, :start_date_sale, :end_date_sale, :date_raffle, :ticket_value, :created_at, :updated_at
json.url raffle_url(raffle, format: :json)
