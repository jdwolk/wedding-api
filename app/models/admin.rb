class Admin < ActiveRecord::Base
  has_many :invites, as: :inviter
end
