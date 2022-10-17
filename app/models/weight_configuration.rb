class WeightConfiguration < ApplicationRecord
  validates :minimum_weight, :maximum_weight, :price, presence: true
  validates :minimum_weight, :maximum_weight, :price, numericality: true 
  validates :minimum_weight, :maximum_weight, :price, numericality: { only_integer: true }
  validates :maximum_weight, comparison: { greater_than: :minimum_weight }
  validates :minimum_weight, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :shipping_type

  def self.shipping_types_for_select
    ShippingType.all.map do |shipping_type|
      [shipping_type.name, shipping_type.id]
    end
  end

end
