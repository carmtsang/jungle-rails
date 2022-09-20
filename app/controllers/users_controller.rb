class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to "/"
      else
        redirect_to "/signup"
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
