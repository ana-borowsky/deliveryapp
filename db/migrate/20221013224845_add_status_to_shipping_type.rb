class AddStatusToShippingType < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_types, :status, :boolean
  end
end
