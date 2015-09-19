class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      #remember(user)
      flash[:notice] = "Signed in successfully"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = 'Signed out successfully'
    redirect_to root_url
  end
end
