# == Schema Information
# Schema version: 20190812154049
#
# Table name: shipping_service_providers
#
#  id                 :integer          not null, primary key
#  name               :string
#  flat_rate_cents    :integer          default(0), not null
#  flat_rate_currency :string           default("USD"), not null
#
# Indexes
#
#  index_shipping_service_providers_on_name  (name)
#

class ShippingServiceProvider < ActiveRecord::Base
  monetize :flat_rate_cents, as: 'flat_rate', with_model_currency: :flat_rate_currency
end
