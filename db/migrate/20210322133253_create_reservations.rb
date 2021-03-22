class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :transaction_price
      t.date :start_time
      t.date :end_time
      t.boolean :accepted
      t.references :user, null: false, foreign_key: true
      t.references :pedalo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
