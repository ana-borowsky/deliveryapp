class CreateWeightConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :weight_configurations do |t|
      t.integer :minimum_weight
      t.integer :maximum_weight
      t.integer :price

      t.timestamps
    end
  end
end
