class AddMaintenanceToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :maintenance, :boolean, default: false
  end
end
