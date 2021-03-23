class ChangeDefaultValueReservationAccepted < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :accepted, :string, default: 'pending'
    change_column :users, :role, :string, default: 'client'
  end
end
