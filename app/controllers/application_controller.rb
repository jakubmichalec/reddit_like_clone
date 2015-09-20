class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def only_logged_users
      unless logged_in?
        flash[:danger] = "You must log in first"
        redirect_to login_url
      end
    end

    helper_method :current_user
    helper_method :only_logged_users

end
