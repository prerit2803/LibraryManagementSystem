class AddRoomToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :room, index: true, foreign_key: true
  end
end
