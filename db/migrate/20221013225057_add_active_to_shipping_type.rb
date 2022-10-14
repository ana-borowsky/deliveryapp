class AddActiveToShippingType < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_types, :active, :boolean, default:true
  end
end
