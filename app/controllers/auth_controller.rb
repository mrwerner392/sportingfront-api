class AuthController < ApplicationController

  def login
    user = User.find_by(email: params[:email])
    render json: { message: 'We could not find an account with that email.' }, status: :unprocessable_entity unless user

    if user.authenticate(params[:password])
      render json: authentication_json(user.id)
    else
      render json: { message: 'Incorrect password. Please try again.' }, status: :unprocessable_entity
    end
  end

end