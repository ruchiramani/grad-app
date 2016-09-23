class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :learn_uid
      t.string :first_name
      t.string :last_name
      t.string :learn_oauth_token
    end
  end
end
