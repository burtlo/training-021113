class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_login
    if not logged_in?
      flash[:message] = "You must be logged in!"
      redirect_to login_path
    end
  end


end
