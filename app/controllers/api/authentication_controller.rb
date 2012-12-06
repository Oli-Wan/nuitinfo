class Api::AuthenticationController < ApplicationController
  def authenticate
    @user = User.authenticate(params[:email], params[:password])
    if (@user)
      render :authenticate
    else
      render json: {error: "email and password, motherfucker"}, status: 403
    end
  end
end
