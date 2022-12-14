class WorkOrder < ApplicationRecord
  validates :pickup_address, :product_weight, :delivery_address, :product_code, :distance, presence: true
  validates :distance, :product_weight, numericality: true 
  validates :product_code, length: { is: 10 }
  validates :product_weight, numericality: { greater_than_or_equal_to: 1 }
  validates :distance, numericality: { greater_than: 0 }
  validates :distance, :product_weight, numericality: { only_integer: true }

  enum status: { pending:0, delivered:1, canceled:2, late:3, on_the_way:4 }
  before_validation :generate_code, on: :create

  belongs_to :shipping_type, optional: true
  belongs_to :vehicle, optional: true

  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.statuses.#{status}"), status]
    end
  end

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
end
