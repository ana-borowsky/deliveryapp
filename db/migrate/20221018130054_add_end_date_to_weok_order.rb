class AddEndDateToWeokOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :end_date, :date
  end
end
