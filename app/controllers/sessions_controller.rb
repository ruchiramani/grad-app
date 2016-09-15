class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_oauth(request.env["omniauth.auth"])
  end

  def destroy
  end
end
