class AlterColumnToRooms < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :lib_name, :string
  end
end
