class WeightConfiguration < ApplicationRecord
  validates :minimum_weight, :maximum_weight, :price, presence: true
  validates :minimum_weight, :maximum_weight, :price, numericality: true 
  validates :minimum_weight, :maximum_weight, :price, numericality: { only_integer: true }

end
