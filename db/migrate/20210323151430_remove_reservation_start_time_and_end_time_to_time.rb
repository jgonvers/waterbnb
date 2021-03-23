class RemoveReservationStartTimeAndEndTimeToTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :start_time
    remove_column :reservations, :end_time
  end
end
