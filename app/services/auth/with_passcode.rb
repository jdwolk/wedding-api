module Auth
  class WithPasscode
    extend ActiveModel::Naming

    attr_reader :errors

    def initialize(passcode)
      @passcode = passcode
      @errors = ActiveModel::Errors.new(self)
    end

    def success?
      token.present?
    end

    def token
      @token ||= JsonWebToken.encode(guest_id: guest.id) if guest
    end

    private

    attr_reader :passcode

    def guest
      Guest.find_by!(passcode: passcode)
    rescue ActiveRecord::RecordNotFound
      errors.add :user_authentication, I18n.t(:invalid_credentials)
      nil
    end
  end
end
