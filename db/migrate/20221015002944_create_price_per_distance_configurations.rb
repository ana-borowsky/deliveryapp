class CreatePricePerDistanceConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :price_per_distance_configurations do |t|
      t.integer :minimum_distance
      t.integer :maximum_distance
      t.integer :price_per_distance
      t.references :shipping_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
