class CohortsController < ApplicationController
  before_action :set_api_client, only: ['create']
  def new
    @cohort = Cohort.new
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      UserCohort.create(user: current_user, cohort: @cohort)
      CohortStudentBuilder.new(@cohort, @client).execute
      redirect_to cohort_path(@cohort)
    end
  end

  private
  def cohort_params
    params.require(:cohort).permit(:name, :learn_batch_id)
  end

  def set_api_client
    binding.pry
    @client = Adapter::LearnApi::Client.new(token: current_user.learn_oauth_token)
  end
end
