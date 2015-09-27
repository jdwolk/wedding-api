class Attendee < ActiveRecord::Base
  has_one :invite, dependent: :destroy

  delegate :accepted?, to: :invite

  validates :first_name, :last_name, presence: true
  validates :passcode, uniqueness: true
end
