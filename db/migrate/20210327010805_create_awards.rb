class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.references :raffle, null: false, foreign_key: true
      t.string :description
      t.integer :placing
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
