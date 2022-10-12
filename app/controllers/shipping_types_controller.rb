class ShippingTypesController < ApplicationController
  def index
    @shipping_types = ShippingType.all
  end
end