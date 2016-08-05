class AddNoToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :no, :integer
  end
end
