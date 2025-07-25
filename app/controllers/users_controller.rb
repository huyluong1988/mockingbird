class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  def authenticate
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: user, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
