class AddReservationStartTimeAndEndTimeToDatetime < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :start_time, :datetime
    add_column :reservations, :end_time, :datetime
  end
end
