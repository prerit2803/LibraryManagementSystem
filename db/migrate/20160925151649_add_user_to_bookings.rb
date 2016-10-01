class AddUserToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :user, index: true, foreign_key: true
  end
end
