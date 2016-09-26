class SessionsController < ApplicationController
  before_action :set_auth_hash, only: ["create"]
  def new
  end

  def create
      user = User.find_or_create_from_oauth(@auth_hash)
    if user
      log_in(user)
      cohort = user.cohort_ids[0]
      redirect_to cohort_path(cohort)
    end

  end

  def destroy
  end

  private
  def set_auth_hash
    @auth_hash = request.env["omniauth.auth"]
  end
end
