class InviteFiller
  attr_reader :resource

  def initialize(resource)
    @resource = resource
  end

  def invites_left?
    unfilled_invites.count > 0
  end

  def fill_invite(guest_attrs)
    return with_error(I18n.t(:no_invites_left)) unless invites_left?
    return with_error(I18n.t(:must_accept_invite)) unless resource.accepted?
    available_invite.update(
      invitee: guest_from(guest_attrs)
    )
  end

  private

  def available_invite
    unfilled_invites.first
  end

  def unfilled_invites
    sendable_invites.where(invitee: nil)
  end

  def with_error(message)
    errors.add(:sendable_invites, message)
  end

  def guest_from(guest_attrs)
    Guest.new(guest_attrs)
  end
end
