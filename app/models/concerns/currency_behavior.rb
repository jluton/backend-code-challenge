module CurrencyBehavior
  extend ActiveSupport::Concern

  # For a real implementation with many currencies, we would probably want to use a currency model.
  # Since this is an exercise, I have used a hash
  EXCHANGE_RATES_TO_USD = {
    'USD': 1.0,
    'EUR': 1.18115
  }

  included do
    after_save :set_USD_rate, if: :updated_rate?
  end

  def updated_rate?
    saved_change_to_rate_cents? || saved_change_to_rate_currency?
  end

  # For this exercise I have simply rounded the conversion to the nearest cent.
  # For real-world applications, a more precise conversion may be warrented.
  def set_USD_rate
    currency_code = self.rate.currency.iso_code
    rate_original = self.rate.fractional.to_f / 100
    rate_USD = rate_original * EXCHANGE_RATES_TO_USD[currency_code.to_sym]

    self.assign_attributes(USD_rate: rate_USD.round(2))
    self.save!
  end
end