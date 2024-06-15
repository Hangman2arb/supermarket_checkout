# Supermarket Checkout System

## Introduction

Welcome to the Supermarket Checkout System project. This system is designed to handle the checkout process for a small chain of supermarkets. It supports adding products to a cart, calculating the total price, and applying various pricing rules such as buy-one-get-one-free offers and bulk purchase discounts. The project is implemented in Ruby and follows the Test-Driven Development (TDD) methodology.

## Features

- **Flexible Pricing Rules**: Easily define and apply pricing rules.
- **Product Scanning**: Scan items in any order and calculate the total price.
- **Discounts**: Supports various discount strategies like buy-one-get-one-free, bulk purchase discounts, and volume discounts.

## Requirements

- Ruby 3.0.0
- Bundler

## Getting Started

### 1. Clone the Repository

```sh
git clone https://github.com/Hangman2arb/supermarket_checkout.git
cd supermarket_checkout
```

### 2. Install Dependencies

```sh
bundle install
```

### 3. Run Tests

To ensure everything is set up correctly, run the tests:

```sh
rspec
```

### 4. Usage Example

A script named `checkout_demo.rb` is provided in the root of the project to demonstrate the functionality of the checkout system. You can run this script to see how the system works:

```sh
ruby checkout_demo.rb
```

The script will output the total price for a predefined set of scanned items based on the implemented pricing rules.

## Project Structure

```
supermarket_checkout/
├── Gemfile
├── Gemfile.lock
├── checkout_demo.rb
├── lib/
│   ├── checkout.rb
│   └── pricing_rules.rb
└── spec/
    ├── checkout_spec.rb
    └── spec_helper.rb
```

### Description of Files

- **Gemfile**: Specifies the gem dependencies for the project.
- **Gemfile.lock**: Locks the gem dependencies to specific versions.
- **checkout_demo.rb**: A script to demonstrate the checkout process and pricing rules.
- **lib/checkout.rb**: Contains the `Checkout` class, which handles item scanning and total price calculation.
- **lib/pricing_rules.rb**: Contains the `PricingRules` module, which defines various pricing rules as lambdas.
- **spec/checkout_spec.rb**: Contains the RSpec tests for the `Checkout` class to ensure the pricing rules are applied correctly.
- **spec/spec_helper.rb**: Contains the configuration for RSpec.

## Test Explanations

The tests ensure that the checkout system applies the pricing rules correctly. Here’s a detailed explanation of each test:

### 1. Buy One Get One Free Rule for Green Tea

**Test:**

```ruby
it 'applies buy one get one free rule correctly for three green tea' do
  scan_items(%w[GR1 SR1 GR1 GR1 CF1])
  expect(checkout.total).to eq(22.45)
end
```

**Explanation:**
This test scans three green teas (`GR1`), one strawberry (`SR1`), and one coffee (`CF1`). The buy-one-get-one-free rule should apply to the green teas, resulting in the total price being calculated correctly.

### 2. Buy One Get One Free Rule for Two Green Teas

**Test:**

```ruby
it 'applies buy one get one free rule correctly for two green teas' do
  scan_items(%w[GR1 GR1])
  expect(checkout.total).to eq(3.11)
end
```

**Explanation:**
This test scans two green teas (`GR1`). The buy-one-get-one-free rule should apply, resulting in the customer only being charged for one green tea.

### 3. Bulk Purchase Discount for Strawberries

**Test:**

```ruby
it 'applies bulk purchase discount correctly for strawberries' do
  scan_items(%w[SR1 SR1 GR1 SR1])
  expect(checkout.total).to eq(16.61)
end
```

**Explanation:**
This test scans three strawberries (`SR1`) and one green tea (`GR1`). The bulk purchase discount should apply to the strawberries, reducing their price if three or more are purchased.

### 4. Volume Discount for Coffee

**Test:**

```ruby
it 'applies volume discount correctly for coffee' do
  scan_items(%w[GR1 CF1 SR1 CF1 CF1])
  expect(checkout.total).to eq(30.57)
end
```

**Explanation:**
This test scans one green tea (`GR1`), three coffees (`CF1`), and one strawberry (`SR1`). The volume discount should apply to the coffees when three or more are purchased.

## Contributing

Feel free to submit issues and enhancement requests.

## License

This project is licensed under the MIT License.
