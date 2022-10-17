class AddStartDateToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :start_date, :date
  end
end
