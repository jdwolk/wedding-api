module V1
  class GuestsController < BaseController
    def index
      respond_with Guest.all
    end
  end
end
