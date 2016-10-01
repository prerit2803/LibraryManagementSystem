class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password
      t.string :password_confirm
      t.integer :can_book
      t.boolean :admin
      t.integer :usertype

      t.timestamps
    end
  end
end
