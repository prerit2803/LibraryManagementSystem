class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :b_date
      t.time :from_time
      t.time :to_time
      t.string :status

      t.timestamps
    end
  end
end
