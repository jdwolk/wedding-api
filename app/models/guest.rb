class Guest < ActiveRecord::Base
  has_one :received_invite,
          class_name: 'Invite',
          dependent: :destroy

  has_many :sendable_invites,
           as: :inviter,
           class_name: 'Invite'

  delegate :accepted?, to: :received_invite

  validates :first_name, :last_name, presence: true
  validates :passcode, uniqueness: true

  before_create :set_passcode

  private

  def set_passcode
    self.passcode = make_passcode
  end

  def make_passcode
    alphanum = ('A'..'Z').to_a + (0..9).map(&:to_s)
    code = (0..6).map { alphanum[rand(alphanum.length)] }.join
    already_exists = Guest.find_by(passcode: code)
    already_exists ? make_passcode : code
  end
end
