module Inviting
  class Granter
    attr_reader :num_invites

    def self.grant(num_invites)
      new(num_invites)
    end

    def initialize(num_invites)
      @num_invites = num_invites
    end

    def to(invite_filler)
      invite_filler.sendable_invites.build(invite_attrs)
    end

    def invites
      self # for chainable API purposes, i.e. grant(3).invites.to(person)
    end

    private

    def invite_attrs
      num_invites.times.map do
        {} # TODO: Add other attrs here if needed
      end
    end
  end
end
