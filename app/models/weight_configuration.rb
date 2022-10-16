class WeightConfiguration < ApplicationRecord
  validates :minimum_weight, :maximum_weight, :price, presence: true
  validates :minimum_weight, :maximum_weight, :price, numericality: true 
  validates :minimum_weight, :maximum_weight, :price, numericality: { only_integer: true }
  validates :maximum_weight, comparison: { greater_than: :minimum_weight }
  validates :minimum_weight, numericality: { greater_than_or_equal_to: 1 }
end
