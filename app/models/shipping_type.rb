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
  has_many :weight_configurations
  has_many :work_orders

  def calculate_price(distance, weight)
    price_distance = price_per_distance_configurations.where("minimum_distance <= ?", distance)
                                                      .where("maximum_distance >= ?", distance)
                                                      .first.price_per_distance
    price_weight = weight_configurations.where("minimum_weight <= ?", weight)
                                        .where("maximum_weight >= ?", weight)
                                        .first.price
    fee/100 + (price_distance/100) * distance + price_weight/100 * weight/1000
  end

  def calculate_delivery_time(distance)
    time_configuration = delivery_time_configurations.where("minimum_distance <= ?", distance)
                                              .where("maximum_distance >= ?", distance)
                                              .first
    if time_configuration 
      time_configuration.delivery_time
    else
      nil
    end
  end
end
