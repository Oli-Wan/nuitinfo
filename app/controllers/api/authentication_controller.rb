class Api::AuthenticationController < ApplicationController
  before_filter :authenticate_user!, only: :test_token

  def authenticate
    @user = User.authenticate(params[:email], params[:password])
    if (@user)
      @user.reset_authentication_token!
      render :authenticate
    else
      render json: {error: "email and password, motherfucker"}, status: 403
    end
  end

  def test_token
    render :test_token
  end
end
