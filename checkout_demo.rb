require_relative 'lib/checkout'
require_relative 'lib/pricing_rules'

pricing_rules = {
  'GR1' => PricingRules.buy_one_get_one_free,
  'SR1' => PricingRules.bulk_purchase_discount(3, 4.50),
  'CF1' => PricingRules.volume_discount(3, 2/3.0)
}

checkout = Checkout.new(pricing_rules)

checkout.scan('GR1')
checkout.scan('SR1')
checkout.scan('GR1')
checkout.scan('GR1')
checkout.scan('CF1')

total = checkout.total
puts "Total price: £#{total}"