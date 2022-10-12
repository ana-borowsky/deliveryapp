class CreateShippingTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_types do |t|
      t.string :name
      t.integer :minimum_distance
      t.integer :maximum_distance
      t.integer :minimum_weight
      t.integer :maximum_weight
      t.integer :fee

      t.timestamps
    end
  end
end
