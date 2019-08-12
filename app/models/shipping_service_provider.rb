# == Schema Information
# Schema version: 20190812203253
#
# Table name: shipping_service_providers
#
#  id            :integer          not null, primary key
#  name          :string
#  rate_cents    :integer          default(0), not null
#  rate_currency :string           default("USD"), not null
#  USD_rate      :float
#
# Indexes
#
#  index_shipping_service_providers_on_name  (name)
#

class ShippingServiceProvider < ActiveRecord::Base
  include CurrencyBehavior

  monetize :rate_cents, as: 'rate', with_model_currency: :rate_currency
end