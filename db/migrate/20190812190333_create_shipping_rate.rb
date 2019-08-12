class CreateShippingRate < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_rates do |t|
      t.string :name, index: true
      t.monetize :rate_per_kilo
      t.string :origin
      t.string :destination
    end
  end
end