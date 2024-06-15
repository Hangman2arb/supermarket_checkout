class Checkout
  attr_reader :items

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    total_price = 0.0

    grouped_items = @items.group_by { |item| item }
    grouped_items.each do |item, item_list|
      rule = @pricing_rules[item]
      total_price += if rule
                       rule.call(item_list)
                     else
                       item_list.size * PRODUCTS[item][:price]
                     end
    end

    total_price.round(2)
  end
end

PRODUCTS = {
  'GR1' => { name: 'Green tea', price: 3.11 },
  'SR1' => { name: 'Strawberries', price: 5.00 },
  'CF1' => { name: 'Coffee', price: 11.23 }
}

