class SessionsController < ApplicationController
  skip_before_action :ensure_user_login, only: [:new, :create]
  def new
    #Login page - direct to views/sessions/new.html.erb.
  end

  def create
    username = User.find_by(username: params[:user][:username])
    password = params[:user][:password]

    if username && username.authenticate(password)
      session[:user_id] = username.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to login_path, alert: "username/password is not valid!"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "logged out!"
  end
end
