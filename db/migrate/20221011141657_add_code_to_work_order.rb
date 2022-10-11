class AddCodeToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :code, :string
  end
end
