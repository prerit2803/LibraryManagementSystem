class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.integer :size
      t.integer :lib_name
      t.string :status

      t.timestamps
    end
  end
end
