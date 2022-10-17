class AddShippingTypeToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :work_orders, :shipping_type, foreign_key: true
  end
end
