class AddProductCodeToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :product_code, :string
  end
end
