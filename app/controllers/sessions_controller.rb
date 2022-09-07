class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user
        redirect_to root
      else
        redirect_to login_path
      end
  end

end
