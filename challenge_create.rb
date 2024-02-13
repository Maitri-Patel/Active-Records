
require_relative 'ar'

# Create three products using different ways

# 1. Using new and assigning attributes individually
product1 = Product.new
product1.name = "Brocolie"
product1.description = "3 for 10$ "
product1.price = 2.99
product1.stock_quantity = 15
product1.category_id = 1
product1.save!

# 2. Using create method with attributes hash
product2 = Product.create(
  name: "apple juice",
  description: "Buy 3 get 2 free",
  price: 15.99,
  stock_quantity: 20,
  category_id: 2
)

# 3. Using create method with block
product3 = Product.create do |p|
  p.name = "kiwi"
  p.description = "Fresh Avaocado on first rack"
  p.price = 10.99
  p.stock_quantity = 25
  p.category_id = 3
end

puts "Product 1 saved successfully!" if product1.persisted?
puts "Product 2 saved successfully!" if product2.persisted?
puts "Product 3 saved successfully!" if product3.persisted?

# Create a Product object with missing required columns
invalid_product = Product.new(description: "Invalid product description")

# Attempt to save the invalid product and print AR errors
if invalid_product.save
  puts "Invalid product saved successfully! (This shouldn't happen)"
else
  puts "Error saving invalid product:"
  puts invalid_product.errors.full_messages
end
