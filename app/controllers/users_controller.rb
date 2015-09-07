class UsersController < ApplicationController

  expose(:user, attributes: :permitted_params)

  def show

  end

  def new
  end

  def create
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thank you for signing up"
      redirect_to root_url
    else
      render 'new'
    end
  end


  private
    def permitted_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
