require 'rspec'
require_relative '../lib/checkout'
require_relative '../lib/pricing_rules'

RSpec.describe Checkout do
  let(:pricing_rules) do
    {
      'GR1' => PricingRules.buy_one_get_one_free,
      'SR1' => PricingRules.bulk_purchase_discount(3, 4.50),
      'CF1' => PricingRules.volume_discount(3, 2.0 / 3.0)
    }
  end

  let(:checkout) { Checkout.new(pricing_rules) }

  def scan_items(items)
    items.each { |item| checkout.scan(item) }
  end

  it 'applies buy one get one free discount for green tea and no discount for strawberries and coffee' do
    scan_items(%w[GR1 SR1 GR1 GR1 CF1])
    expect(checkout.total).to eq(22.45)
  end

  it 'applies buy one get one free discount correctly when there are only two green teas' do
    scan_items(%w[GR1 GR1])
    expect(checkout.total).to eq(3.11)
  end

  it 'applies bulk purchase discount for strawberries when buying three strawberries and one green tea' do
    scan_items(%w[SR1 SR1 GR1 SR1])
    expect(checkout.total).to eq(16.61)
  end

  it 'applies volume discount for coffee when buying three coffees, with no other discounts' do
    scan_items(%w[GR1 CF1 SR1 CF1 CF1])
    expect(checkout.total).to eq(30.57)
  end
end

