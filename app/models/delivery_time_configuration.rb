class DeliveryTimeConfiguration < ApplicationRecord
  validates :minimum_distance, :maximum_distance, :delivery_time, :shipping_type, presence: true
  validates :minimum_distance, :maximum_distance, :delivery_time, numericality: true 
  validates :minimum_distance, :maximum_distance, :delivery_time, numericality: { only_integer: true }
  validates :maximum_distance, comparison: { greater_than: :minimum_distance }
  validates :maximum_distance, comparison: { less_than_or_equal_to: 1000 }

  belongs_to :shipping_type

  def self.shipping_types_for_select
    ShippingType.all.map do |shipping_type|
      [shipping_type.name, shipping_type.id]
    end
  end
end
