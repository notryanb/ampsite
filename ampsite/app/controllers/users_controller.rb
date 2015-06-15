class UsersController < ApplicationController

  #see all users
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
    render 'show'
  end

  # POST Updates
  def update
  end
  


  # GET Editing user account info
  def edit
    render 'edit'
  end


  def avatar
    render 'avatar'
  end

  def edit_avatar
  end

  def signature
    render 'signature'
  end

  def edit_signature
  end

  def profile
    render 'profile'
  end

  def edit_profile
  end



  private

  def user_params
    params.require(:user).permit(:username, 
                                 :email, 
                                 :password, 
                                 :password_confirmation)
  end



end