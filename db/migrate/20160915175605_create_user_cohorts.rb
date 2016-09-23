class CreateUserCohorts < ActiveRecord::Migration
  def change
    create_table :user_cohorts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :cohort, index: true, foreign_key: true
    end
  end
end
