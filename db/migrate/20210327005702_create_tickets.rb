class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :raffle, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
