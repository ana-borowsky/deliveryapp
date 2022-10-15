class PricePerDistanceConfiguration < ApplicationRecord
  belongs_to :shipping_type

  def self.shipping_types_for_select
    ShippingType.all.map do |shipping_type|
      [shipping_type.name, shipping_type.id]
    end
  end
end
