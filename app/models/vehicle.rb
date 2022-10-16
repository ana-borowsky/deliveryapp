class Vehicle < ApplicationRecord
  validates :license_plate, :model, :manufacturer, :year, :load_capacity, presence: true
  validates :load_capacity, numericality: true 
  validates :license_plate, length: { is: 7 }
  validates :year, length: { is: 4 }
  validates :load_capacity, numericality: { greater_than_or_equal_to: 1 }
  validates :load_capacity, numericality: { only_integer: true }
end
