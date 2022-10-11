class WorkOrder < ApplicationRecord
  validates :pickup_address, :product_weight, :delivery_address, :product_code, :distance, presence: true
  validates :distance, :product_weight, numericality: true 

  enum status: { pending:0 }
  before_validation :generate_code, on: :create

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
end
