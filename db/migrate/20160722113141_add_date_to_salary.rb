class AddDateToSalary < ActiveRecord::Migration[5.0]
  def change
    add_column :salaries, :date, :date
  end
end
