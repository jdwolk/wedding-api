module Inviting
  class GuestInviter
    attr_reader :attendee

    def initialize(attendee)
      @attendee = attendee
    end

    def invite!
      invite.save!
    end

    def invite
      @invite ||= InviteBuilder.for(attendee).build
    end

    class InviteBuilder
      attr_reader :attendee, :current_time

      def self.for(attendee, options = {})
        new(attendee, options)
      end

      def initialize(attendee, options = {})
        @attendee = attendee
        @current_tine = options[:current_time] || Time.now
      end

      def build
        attendee.build_invite(sent_at: current_time)
      end
    end
  end
end
