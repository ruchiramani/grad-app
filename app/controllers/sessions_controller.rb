class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_oauth(request.env["omniauth.auth"])
    if user
      log_in(user)
      redirect_to root_path
    end  
  end

  def destroy
  end
end
