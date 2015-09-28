module V1
  class AuthController < BaseController
    skip_before_action :authenticate_request

    def create
      auth = Auth::WithPasscode.new(auth_params[:passcode])

      if auth.success?
        render json: { auth_token: auth.token }
      else
        render json: { errors: auth.errors }, status: :unauthorized
      end
    end

    private

    def auth_params
      params.permit(:passcode)
    end
  end
end
