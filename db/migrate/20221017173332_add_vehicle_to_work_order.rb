class AddVehicleToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :work_orders, :vehicle, foreign_key: true
  end
end
