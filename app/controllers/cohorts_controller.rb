class CohortsController < ApplicationController
  def new 
  end

  def create 
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      UserCohort.create(user: current_user, cohort: @cohort) 
      CohortStudentBuilder.new(@cohort).execute
    end
  end

  private 
  def cohort_params
    params.require(:cohort).permit(:name, :learn_batch_id)  
  end  
end
