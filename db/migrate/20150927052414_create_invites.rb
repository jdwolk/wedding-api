class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :attendee, index: true, foreign_key: true
      t.boolean :accepted, default: false

      t.datetime :sent_at
      t.datetime :accepted_at
      t.timestamps
    end
  end
end
