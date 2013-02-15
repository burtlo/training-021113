class AuthorSessionsController < ApplicationController
  before_filter :require_login, except: [ :new, :create, :destroy ]

  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    if login(params[:username], params[:password])
      redirect_back_or_to articles_path, message: "Logged In Successfully"
    else
      flash[:message] = "Login Failed"
      render :new
    end
  end
  
  def destroy
    logout
    flash[:message] = 'Logged out!'
    redirect_to articles_path #, message: 'Logged out!'
  end

end