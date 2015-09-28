class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :passcode, null: false

      t.timestamps null: false
    end

    add_index :guests, :passcode, unique: true
  end
end
