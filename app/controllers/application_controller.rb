class ApplicationController < ActionController::API

  def authentication_json(user_id)
    { token: make_token(user_id), user: User.find(user_id) }
  end

  def make_token(user_id)
    payload = {user_id: user_id}
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def hmac_secret
    ENV["JWT_SECRET_KEY"]
  end

end
