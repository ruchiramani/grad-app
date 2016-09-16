class Cohort < ActiveRecord::Base
  has_many :user_cohorts
  has_many :users, through: :user_cohorts
  has_many :students  
end
