class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # GET Create User
  def new
  end

  # POST create User
  def create

  end

  # For user Profile
  def show

  end

  # For seeing all users
  def all
  end

  # GET Editing user profile
  def edit
  end

  # POST Updates
  def update
  end

  # create a user session
  def login
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  # end a user session
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end



end