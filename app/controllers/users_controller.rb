class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to 'welcome#home'
    else 
      redirect_to(controller: 'users', action: 'new')
    end 
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation)
  end
end