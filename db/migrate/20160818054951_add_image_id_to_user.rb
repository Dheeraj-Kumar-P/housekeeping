class AddImageIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_id, :string
    add_column :users, :integer, :string
  end
end
