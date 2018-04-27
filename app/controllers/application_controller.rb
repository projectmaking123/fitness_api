class ApplicationController < ActionController::API
  # acts_as_token_authentication_handler_for User, fallback: :none

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  private

  def get_token
    request.headers['Authorization'].split(' ').last
  end

  def payload
    JWT.decode(get_token, Rails.application.secrets_key_base, true, { algorithm: 'HS256' }).first
  end
end
