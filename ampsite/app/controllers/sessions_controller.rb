class SessionsController < ApplicationController
  def index
  end

  def new
    @user = User.new
    render 'new' 
  end

  def create
    @user = User.find_by(username: user_params[:username])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @err = "Sorry, your username or password was incorrect."
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:username, 
                                 :email, 
                                 :password, 
                                 :password_confirmation)
  end

end
