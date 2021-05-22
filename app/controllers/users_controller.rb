class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :find_and_authorize_user, except: [:create]

  def create
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    if password != password_confirmation
      render json: { message: 'Passwords do not match.' }, status: :unprocessable_entity
    end

    user = User.create(email: email, password: password)
    if user.valid?
      render json: authentication_json(user.id)
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  private

  def find_and_authorize_user
    id = params[:user_id]
    render json: { message: 'Something went wrong. Please try again.' }, status: :bad_request unless id

    is_right_user?(id)
    @user = User.find(id)
  end

end