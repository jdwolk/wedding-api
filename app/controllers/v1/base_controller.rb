require 'application_responder'

module V1
  class BaseController < ApplicationController
    self.responder = ApplicationResponder
    respond_to :json, :js

    before_action :authenticate_request

    attr_reader :current_guest
    helper_method :current_guest

    private

    def authenticate_request
      auth = Auth::ForRequest.new(request.headers)
      @current_guest = auth.guest

      render(
        json: { error: auth.errors },
        status: :unauthorized
      ) unless @current_guest
    end
  end
end
