class ShippingType < ApplicationRecord
  validates :name, :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :fee, presence: true
  validates :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :fee, numericality: true 
  validates :minimum_distance, :maximum_distance, :fee, numericality: { greater_than: 0 }
  validates :maximum_distance, comparison: { greater_than: :minimum_distance }
  validates :maximum_distance, comparison: { less_than_or_equal_to: 1000 }
  validates :minimum_weight, :maximum_weight, :minimum_distance, :maximum_distance, :fee, numericality: { only_integer: true }
  validates :maximum_weight, comparison: { greater_than: :minimum_weight }
  validates :minimum_weight, numericality: { greater_than_or_equal_to: 1 }

  has_many :delivery_time_configurations
  has_many :price_per_distance_configurations
end
