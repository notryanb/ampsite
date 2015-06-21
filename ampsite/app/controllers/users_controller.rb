class UsersController < ApplicationController

  before_action :authorize, only: [:show, :update, :edit, :avatar, :signature, :profile ]

  before_action :authorize!, only: [:admin]

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

  # GET Editing user account info
  def edit
    @user = current_user
    render 'edit'
  end
  
  # POST Updates
  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      render 'show'
    else
      render action: :edit
    end
  end
  

  def avatar
    @user = current_user
    render 'avatar'
  end

  def signature
    @user = current_user
    render 'signature'
  end

  def profile
    @user = current_user
    render 'profile'
  end

  def admin
    render 'admin'
  end

  private

  def user_params
    params.require(:user).permit(:username, 
                                 :email, 
                                 :password, 
                                 :password_confirmation,
                                 :avatar,
                                 :signature,
                                 :location)
  end

end