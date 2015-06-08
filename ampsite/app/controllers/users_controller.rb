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
  end

  # end a user session
  def logout
  end

  def test
    redirect_to 'test'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end



end