class AddCommonCurrencyToShippingRateAndShippingServiceProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_service_providers, :USD_rate, :float, nil: true
    add_column :shipping_rates, :USD_rate, :float, nil: true
  end
end
