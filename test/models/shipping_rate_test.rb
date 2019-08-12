# == Schema Information
# Schema version: 20190812203253
#
# Table name: shipping_rates
#
#  id            :integer          not null, primary key
#  name          :string
#  rate_cents    :integer          default(0), not null
#  rate_currency :string           default("USD"), not null
#  origin        :string
#  destination   :string
#  USD_rate      :float
#
# Indexes
#
#  index_shipping_rates_on_name  (name)
#

require './test/test_helper'

class ShippingRateTest < ActiveSupport::TestCase
  def test_validates_origin_and_destination_format
    valid_shipping_rate = ShippingRate.new(rate_per_kilo_cents: 1000, rate_per_kilo_currency: 'EUR', origin: 'FR', destination: 'CA')
    invalid_shipping_rate = ShippingRate.new(rate_per_kilo_cents: 1000, rate_per_kilo_currency: 'EUR', origin: 'FRA', destination: 'CAN')

    assert valid_shipping_rate.valid?
    assert_not invalid_shipping_rate.valid?
    assert_equal 'must be 2-letter country code', invalid_shipping_rate.errors[:destination].first
    assert_equal 'must be 2-letter country code', invalid_shipping_rate.errors[:origin].first
  end
end