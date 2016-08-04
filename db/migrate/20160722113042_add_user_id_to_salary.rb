class AddUserIdToSalary < ActiveRecord::Migration[5.0]
  def change
    add_column :salaries, :user_id, :integer
  end
end
