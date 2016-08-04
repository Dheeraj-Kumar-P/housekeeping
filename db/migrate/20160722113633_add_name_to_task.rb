class AddNameToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :name, :string
  end
end
