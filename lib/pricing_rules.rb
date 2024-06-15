module PricingRules
  def self.buy_one_get_one_free
    lambda do |items|
      count = items.size
      price = PRODUCTS[items.first][:price]
      (count / 2 + count % 2) * price
    end
  end

  def self.bulk_purchase_discount(threshold, discounted_price)
    lambda do |items|
      count = items.size
      price = count >= threshold ? discounted_price : PRODUCTS[items.first][:price]
      count * price
    end
  end

  def self.volume_discount(threshold, discount_factor)
    lambda do |items|
      count = items.size
      price = count >= threshold ? PRODUCTS[items.first][:price] * discount_factor : PRODUCTS[items.first][:price]
      count * price
    end
  end
end

