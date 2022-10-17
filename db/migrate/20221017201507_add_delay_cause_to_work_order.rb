class AddDelayCauseToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :delay_cause, :string
  end
end
