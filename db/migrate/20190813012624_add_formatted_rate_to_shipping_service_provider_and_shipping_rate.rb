class AddFormattedRateToShippingServiceProviderAndShippingRate < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_rates, :formatted_rate, :float
    add_column :shipping_service_providers, :formatted_rate, :float
  end
end
