class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :created
    else
      render json: { error: 'Unable to create new user' }, status: :unprocessable_entity
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def auto_login
    render json: { user: @user }, status: :ok
  end

  private

  def user_params
    params.permit(:username, :password, :admin, :email)
  end
end
