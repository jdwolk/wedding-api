class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :passcode

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip


      t.timestamps null: false
    end

    add_index :guests, :reset_password_token, unique: true
    add_index :guests, :passcode, unique: true
  end
end
