class AddDeductionToSalary < ActiveRecord::Migration[5.0]
  def change
    add_column :salaries, :deduction, :integer
  end
end
