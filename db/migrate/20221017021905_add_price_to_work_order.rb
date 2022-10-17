class AddPriceToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :price, :integer
  end
end
