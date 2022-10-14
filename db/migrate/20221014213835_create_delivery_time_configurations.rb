class CreateDeliveryTimeConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_time_configurations do |t|
      t.integer :delivery_time
      t.integer :minimum_distance
      t.integer :maximum_distance
      t.references :shipping_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
