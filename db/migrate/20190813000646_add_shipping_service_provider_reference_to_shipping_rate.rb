class AddShippingServiceProviderReferenceToShippingRate < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_rates, :shipping_service_provider_id, :integer
  end
end
