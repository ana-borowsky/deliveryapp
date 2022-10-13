class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :year
      t.string :manufacturer
      t.string :model
      t.string :license_plate
      t.integer :load_capacity

      t.timestamps
    end
  end
end
