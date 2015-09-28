class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email, null: false, index: true, unique: true
      t.timestamps
    end
  end
end
