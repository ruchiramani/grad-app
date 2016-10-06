class User < ActiveRecord::Base
  has_many :user_cohorts
  has_many :cohorts, through: :user_cohorts
  has_many :entries




  def self.find_or_create_from_oauth(auth_hash)
    User.find_or_create_by(learn_uid: auth_hash["uid"]).tap do |user|
      user.first_name = auth_hash["info"]["first_name"]
      user.last_name = auth_hash["info"]["last_name"]
      user.email = auth_hash["info"]["email"]
      user.learn_oauth_token = auth_hash["info"]["token"]
      user.admin = auth_hash["info"]["admin"]
      user.save
    end
  end

end
