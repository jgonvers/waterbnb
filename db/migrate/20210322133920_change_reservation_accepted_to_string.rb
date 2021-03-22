class ChangeReservationAcceptedToString < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :accepted, :string
  end
end
