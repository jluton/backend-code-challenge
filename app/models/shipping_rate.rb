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

class ShippingRate < ActiveRecord::Base
  include CurrencyBehavior

  monetize :rate_cents, as: 'rate', with_model_currency: :rate_currency

  validates_length_of :origin, is: 2, allow_nil: false, message: 'must be 2-letter country code'
  validates_length_of :destination, is: 2, allow_nil: false, message: 'must be 2-letter country code'
end