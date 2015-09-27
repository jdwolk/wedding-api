module Inviting
  class GuestBuilder
    attr_reader :attrs, :options

    def self.guest(attrs = {}, options = {})
      new(attrs, options).guest
    end

    def initialize(attrs = {}, options = {})
      @attrs = attrs
      @options = options
    end

    def guest
      @guest ||= Attendee.new(attrs.merge(passcode: passcode))
    end

    private

    def passcode
      @passcode ||= make_passcode
    end

    def make_passcode
      alphanum = ('A'..'Z').to_a + (0..9).map(&:to_s)
      code = (0..6).map { alphanum[rand(alphanum.length)] }.join
      already_exists = Attendee.find_by(passcode: code)
      already_exists ? make_passcode : code
    end

    def attendees
      @attendees ||= Attendee.send(limiting_scope)
    end

    def limiting_scope
      options[:limiting_scope] || :all
    end
  end
end
