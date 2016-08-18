class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string  :name
      t.timestamps
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
