class CreateWorkOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :work_orders do |t|
      t.string :pickup_address
      t.string :delivery_address
      t.integer :product_weight
      t.integer :distance
      t.integer :status, default: 0
      t.date :date

      t.timestamps
    end
  end
end
