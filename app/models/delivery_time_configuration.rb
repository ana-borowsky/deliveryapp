class DeliveryTimeConfiguration < ApplicationRecord
  validates :minimum_distance, :maximum_distance, :delivery_time, :shipping_type, presence: true
  validates :minimum_distance, :maximum_distance, :delivery_time, numericality: true 
  validates :minimum_distance, :maximum_distance, :delivery_time, numericality: { only_integer: true }

  belongs_to :shipping_type

  def self.shipping_types_for_select
    ShippingType.all.map do |shipping_type|
      [shipping_type.name, shipping_type.id]
    end
  end
end
