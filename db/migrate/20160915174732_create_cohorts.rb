class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :learn_batch_id

      t.timestamps null: false
    end
  end
end
