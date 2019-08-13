require 'csv'

namespace :import do
  desc "Import shipping service provider CSV"
  task :shipping_service_providers => :environment do
    CSV.foreach('./service_provider_data.csv', :headers => true) do |row|
      row_hash = row.to_hash
      data = {
        id: row_hash['id'].to_i,
        name: row_hash['name'],
        rate_currency: row_hash['currency'],
        rate_cents: row_hash['flat shipping rate'].to_i * 100
      }

      ShippingServiceProvider.create!(data)
    end
  end

  desc "Import shipping rates CSV"
  task :shipping_rates => :environment do
    CSV.foreach('./rate_data.csv', :headers => true) do |row|
      row_hash = row.to_hash
      data = {
        origin: row_hash['origin'],
        destination: row_hash['destination'],
        rate_currency: row_hash['currency'],
        rate_cents: row_hash['rate'].to_i * 100,
        shipping_service_provider_id: row_hash['shipping company id']
      }

      ShippingRate.create!(data)
    end
  end
end