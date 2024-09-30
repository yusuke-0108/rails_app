class UsersController < ApplicationController
  # before_action :logged_in_user

  def show
    @user = User.find(params[:id])
  end

  def new
  end
  
  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      reset_session
      log_in user
      redirect_to user_path(user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        redirect_to login_path, status: :see_other
      end
    end
end
