class UsersController < ApplicationController

  def index

  end

  # GET Create User
  def new
    @user = User.new
    render 'new'
  end

  # POST create User
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to '/'
    else
      render action: :new
    end
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


  private

  def user_params
    params.require(:user).permit(:username, 
                                 :email, 
                                 :password, 
                                 :password_confirmation)
  end



end