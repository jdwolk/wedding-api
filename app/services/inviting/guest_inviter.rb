module Inviting
  class GuestInviter
    attr_reader :guest

    def initialize(guest)
      @guest = guest
    end

    def invite!
      invite.save!
    end

    def invite
      @invite ||= InviteBuilder.for(guest).build
    end

    class InviteBuilder
      attr_reader :guest, :current_time

      def self.for(guest, options = {})
        new(guest, options)
      end

      def initialize(guest, options = {})
        @guest = guest
        @current_time = options[:current_time] || Time.now
      end

      def build
        guest.build_invite(sent_at: current_time)
      end
    end
  end
end
