class CreateTrackBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :track_bookings do |t|
      t.string :full_name
      t.string :email
      t.integer :room_no
      t.integer :size
      t.string :lib_name
      t.date :b_date
      t.time :from_time
      t.time :to_time
      t.string :status
      t.integer :booking_id

      t.timestamps
    end
  end
end
