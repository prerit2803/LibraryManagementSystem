class AddCoulmnToTrackBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :track_bookings, :booked_by, :integer
  end
end
