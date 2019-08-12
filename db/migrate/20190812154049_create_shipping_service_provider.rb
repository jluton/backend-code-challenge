class CreateShippingServiceProvider < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_service_providers do |t|
      t.string :name, index: true
      t.monetize :flat_rate
    end
  end
end