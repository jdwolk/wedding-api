module Auth
  class ForRequest
    extend ActiveModel::Naming

    attr_reader :errors

    def initialize(headers = {})
      @headers = headers
      @errors = ActiveModel::Errors.new(self)
    end

    def guest
      @guest ||=
        begin
          errors.add(:token, I18n.t(:invalid_token)) unless found_guest
          found_guest
        end
    end

    private

    attr_reader :headers

    def found_guest
      @found_guest ||=
        Guest.find(decoded_auth_token[:guest_id]) if decoded_auth_token
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      else
        errors.add(:token, I18n.t(:missing_token))
      end
      nil
    end
  end
end
