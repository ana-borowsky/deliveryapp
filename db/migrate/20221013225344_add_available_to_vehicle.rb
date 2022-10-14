class AddAvailableToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :available, :boolean, default: true
  end
end
