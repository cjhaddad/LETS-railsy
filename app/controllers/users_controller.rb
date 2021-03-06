class UsersController < ApplicationController

  skip_before_action :check_for_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: user_params[:name], email: user_params[:email].downcase, password: user_params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path(@user)
    else
      flash.now[:error] = "Sign Up unsuccessful; please try again."
      render(:new)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
