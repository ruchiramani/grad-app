class Cohort < ActiveRecord::Base
  has_many :user_cohorts
  has_many :users, through: :user_cohorts


  def students
    self.users.where(admin: false)
  end
end
