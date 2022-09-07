class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.valid?
        @user.save
        redirect_to root
      else
        redirect :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end
end
