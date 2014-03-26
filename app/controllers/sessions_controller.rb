class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user_name, password = params[:user][:user_name], params[:user][:password]

    user = User.find_by_credentials(user_name, password)

    if user
      login!(user)
    else
      flash.now[:errors] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    logout!
  end
end