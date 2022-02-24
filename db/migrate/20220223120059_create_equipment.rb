class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.integer :equipment_number
      t.datetime :allocated_since

      t.timestamps
    end
  end
end
