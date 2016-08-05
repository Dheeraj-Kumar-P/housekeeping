class AddTotalHoursToSalary < ActiveRecord::Migration[5.0]
  def change
    add_column :salaries, :total_hours, :time
  end
end
