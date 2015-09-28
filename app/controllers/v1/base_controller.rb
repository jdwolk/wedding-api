require 'application_responder'

module V1
  class BaseController < ApplicationController
    self.responder = ApplicationResponder
    respond_to :json, :js
  end
end
