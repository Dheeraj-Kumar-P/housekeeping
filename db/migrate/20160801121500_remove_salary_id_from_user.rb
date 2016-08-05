class RemoveSalaryIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :salary_id, :int
  end
end
