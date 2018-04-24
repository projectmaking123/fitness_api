class V1::SessionsController < ApplicationController
  def create
  @user = User.where(email: params[:email]).first

  if @user&.valid_password?(params[:password])
    jwt = JWT.encode(
      {user_id: @user.id, exp: (Time.now + 2.minutes).to_i},
      Rails.application.secrets.secret_key_base,
      'HS256'
    )
    render :create, locals: {token: jwt }, status: :created
  else
    head(:unauthorized)
  end
end

  def destroy
    current_user&.authentication_token = nil
    if current_user&.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
end
