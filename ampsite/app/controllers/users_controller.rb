class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
  end

  # GET Create User
  def new
  end

  # POST create User
  def create
    p "MAKING A NEW USER------------------------"
    @user = User.new(user_params)

    p "VALID USER?!?!?-------- #{@user.valid?}"
    p "ERRORS: #{@user.errors.full_messages}"
    @errs = @user.errors.full_messages
    @wtf = "THIS IS AN ERROR"
    if @user.save
      redirect_to '/'
    else
      p "SAVE ERROR!"
      render action: :index
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

  # create a new user
  def signup

  end

  private

  def user_params
    params.require(:user).permit(:username, 
                                 :email, 
                                 :password, 
                                 :password_confirmation)
  end



end