class PricePerDistanceConfiguration < ApplicationRecord
  validates :minimum_distance, :maximum_distance, :price_per_distance, :shipping_type, presence: true
  validates :minimum_distance, :maximum_distance, :price_per_distance, numericality: true 
  validates :minimum_distance, :maximum_distance, :price_per_distance, numericality: { greater_than: 0 }
  validates :minimum_distance, :maximum_distance, :price_per_distance, numericality: { only_integer: true }

  belongs_to :shipping_type

  def self.shipping_types_for_select
    ShippingType.all.map do |shipping_type|
      [shipping_type.name, shipping_type.id]
    end
  end
end
