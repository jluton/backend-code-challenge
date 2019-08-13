require './test/test_helper'

class ShippingRatesControllerTest < ActionDispatch::IntegrationTest
  def test_index
    provider = ShippingServiceProvider.create(name: 'Emmert International', rate_cents: 10000, rate_currency: 'USD')
    rate = ShippingRate.create(rate_cents: 50000, rate_currency: 'EUR', origin: 'US', destination: 'FR', shipping_service_provider_id: provider.id)

    get shipping_rates_url

    assert_response :success
    json = JSON.parse(@response.body)

    assert_equal 'US', json[0]['origin']
    assert_equal 'FR', json[0]['destination']
    assert_equal 'EUR', json[0]['rate_currency']
    assert_equal 500.00, json[0]['formatted_rate']
    assert_equal 590.57, json[0]['USD_rate']
    assert_equal 'Emmert International', json[0]['shipping_service_provider']['name']
  end
end