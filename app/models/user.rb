class User < ActiveRecord::Base 
  has_many :user_cohorts
  has_many :cohorts, through: :user_cohorts


end
