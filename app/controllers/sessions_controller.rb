class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      log_in user
      flash[:info] = "Welcome, #{user.name}"
      redirect_to user
    else
      flash[:error] = "Could not log in as #{params[:session][:email]}"
      render 'new'
    end
  end
end
