class UserCohort < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user
end
