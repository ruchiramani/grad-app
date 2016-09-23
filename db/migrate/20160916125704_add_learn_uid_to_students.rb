class AddLearnUidToStudents < ActiveRecord::Migration
  def change
    add_column :students, :learn_uid, :string
  end
end
