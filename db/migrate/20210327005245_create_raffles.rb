class CreateRaffles < ActiveRecord::Migration[6.1]
  def change
    create_table :raffles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :kind, null: false, foreign_key: true
      t.string :title
      t.text :description, null: true
      t.datetime :probable_raffle_date
      t.datetime :start_date_sale
      t.datetime :end_date_sale
      t.datetime :date_raffle, null: true
      t.float :ticket_value

      t.timestamps
    end
  end
end
