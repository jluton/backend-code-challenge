require './test/test_helper'

class ShippingRateTest < ActiveSupport::TestCase
  def test_validates_origin_and_destination_format
    valid_shipping_rate = ShippingRate.new(rate_per_kilo_cents: 1000, rate_per_kilo_currency: 'EUR', origin: 'US', destination: 'CA')
    invalid_shipping_rate = ShippingRate.new(rate_per_kilo_cents: 1000, rate_per_kilo_currency: 'EUR', origin: 'USA', destination: 'CAN')

    assert valid_shipping_rate.valid?
    assert_not invalid_shipping_rate.valid?
    assert_equal 'must be 2-letter country code', invalid_shipping_rate.errors[:destination].first
    assert_equal 'must be 2-letter country code', invalid_shipping_rate.errors[:origin].first
  end
end