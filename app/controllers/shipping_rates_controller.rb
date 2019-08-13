class ShippingRatesController < ApplicationController
  def index
    @shipping_rates = ShippingRate.all
    render json: @shipping_rates, include: :shipping_service_provider
  end
end
