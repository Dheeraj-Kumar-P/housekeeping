class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|

      t.timestamps
    end
  end
end
