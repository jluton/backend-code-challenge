require './test/test_helper'

class CurrencyBehaviorTest < ActiveSupport::TestCase
  def test_sets_USD_rate
    shipping_rate = ShippingRate.create(rate_cents: 1000, rate_currency: 'EUR', origin: 'FR', destination: 'CA')
    shipping_service_provider = ShippingServiceProvider.create(name: 'A real provider', rate_cents: 5000, rate_currency: 'US')
    
    assert_equal 11.81, shipping_rate.USD_rate
    assert_equal 50.00, shipping_service_provider.USD_rate
  end
end