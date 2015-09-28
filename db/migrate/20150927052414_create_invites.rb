class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :inviter, polymorphic: true, index: true
      t.belongs_to :invitee
      t.boolean :accepted, default: false

      t.datetime :sent_at
      t.datetime :accepted_at
      t.timestamps
    end
  end
end
