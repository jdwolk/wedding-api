class Invite < ActiveRecord::Base
  belongs_to :inviter, polymorphic: true

  belongs_to :invitee,
             class_name: 'Guest',
             inverse_of: :received_invite
end
