class UnifyModelRateNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :shipping_rates, :rate_per_kilo_cents, :rate_cents
    rename_column :shipping_rates, :rate_per_kilo_currency, :rate_currency
    rename_column :shipping_service_providers, :flat_rate_cents, :rate_cents
    rename_column :shipping_service_providers, :flat_rate_currency, :rate_currency
  end
end