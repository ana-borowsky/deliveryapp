class ShippingType < ApplicationRecord
  validates :name, :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :fee, presence: true
  validates :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :fee, numericality: true 
  validates :minimum_distance, :maximum_distance, :fee, numericality: { greater_than: 0 }
  validates :minimum_weight, :maximum_weight, numericality: { greater_than: 999 }
  validates :minimum_weight, :maximum_weight, :minimum_distance, :maximum_distance, :fee, numericality: { only_integer: true }

  has_many :delivery_time_configurations
  has_many :price_per_distance_configurations
end
