class Admin < ActiveRecord::Base
  has_many :sendable_invites,
           as: :inviter,
           class_name: 'Invite'
end
