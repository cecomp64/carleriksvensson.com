class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      login user
      flash[:info] = "Welcome, #{user.name}"
      redirect_to user
    else
      flash.now[:error] = "Could not log in as #{params[:session][:email]}"
      render 'new'
    end
  end

  def destroy
    logout
    flash[:info] = "You have been logged out."
    redirect_to root_url
  end
end
