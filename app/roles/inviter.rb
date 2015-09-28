class Inviter
  attr_reader :resource

  def initialize(resource)
    @resource = resource
  end

  def invite(guest)
    resource.sendable_invites.build(
      inviter: resource,
      invitee: guest
    )
  end

  def invite!(guest)
    invite(guest).tap(&:save)
  end
end
