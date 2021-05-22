class ApplicationController < ActionController::API

  def make_token(user_id)
    payload = {user_id: user_id}
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def hmac_secret
    ENV["JWT_SECRET_KEY"]
  end

end
