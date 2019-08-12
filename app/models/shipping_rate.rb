# == Schema Information
# Schema version: 20190812190333
#
# Table name: shipping_rates
#
#  id                     :integer          not null, primary key
#  name                   :string
#  rate_per_kilo_cents    :integer          default(0), not null
#  rate_per_kilo_currency :string           default("USD"), not null
#  origin                 :string
#  destination            :string
#
# Indexes
#
#  index_shipping_rates_on_name  (name)
#

class ShippingRate < ActiveRecord::Base
  monetize :rate_per_kilo_cents, as: 'rate_per_kilo', with_model_currency: :rate_per_kilo_currency

  validates_length_of :origin, is: 2, allow_nil: false, message: 'must be 2-letter country code'
  validates_length_of :destination, is: 2, allow_nil: false, message: 'must be 2-letter country code'
end
