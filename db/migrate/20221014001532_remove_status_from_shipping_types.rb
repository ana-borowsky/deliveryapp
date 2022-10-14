class RemoveStatusFromShippingTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :shipping_types, :status
  end
end
