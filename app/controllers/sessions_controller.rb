class SessionsController < ApplicationController

  def new; end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in'
      redirect_to user
    else
      flash.now[:alert] = 'There was something wrong, we can\'t find your account!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out successfully'
    redirect_to root_path
  end

end
