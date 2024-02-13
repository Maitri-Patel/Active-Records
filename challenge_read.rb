load 'ar.rb'
# 1. Use the Product class to find (any) product from the database.
product = Product.first

# 2. Inspect the Product object you have retrieved.
puts "Product details:"
puts product.inspect

# 3. In a comment within your product.rb file, record all the columns that exist in the products table.
# Columns in the products table: id, name, description, price, stock_quantity, category_id, created_at, updated_at

# 4. Use ActiveRecord to find and print out:
# Total number of products
total_products = Product.count
puts "Total number of products: #{total_products}"

# The names of all products above $10 with names that begin with the letter C
products_above_10 = Product.where("price > 10 AND name LIKE 'C%'").pluck(:name)
puts "Names of products above $10 starting with C:"
puts products_above_10

# Total number of products with a low stock quantity (less than 5 in stock)
low_stock_products = Product.where("stock_quantity < 5").count
puts "Total number of products with low stock quantity: #{low_stock_products}"

category = Category.find_by(name: "Jewelry")
product = category.products.first


# Inspect the product object
puts "Product details:"
puts product.inspect

# Find the associated category using the belongs_to association
category = product.category

# Print the name of the associated category
puts "Category Name: #{category.name}"

# Find a specific category
category = Category.find_by(name: "Jewelry")  # Example: Find the category with name "Jewelry"

# Use the category object to build a new product associated with that category
new_product = category.products.build(
  name: "Diamond bracelet",
  description: "special offer this week ",
  price: 30.99,
  stock_quantity: 50
)

# Save the newly created product
if new_product.save
  puts "New product associated with #{category.name} category saved successfully!"
else
  puts "Error saving new product:"
  puts new_product.errors.full_messages
end

# Find a specific category
category = Category.find_by(name: "Jewelry")  # Example: Find the category with name "Jewelry"

# Use the category object to locate all the associated products over a certain price
price_threshold = 20  # Example: Price threshold set to $20
products_above_price = category.products.where("price > ?", price_threshold)

# Print the names of associated products over the specified price
puts "Products in the '#{category.name}' category with price above $#{price_threshold}:"
products_above_price.each do |product|
  puts "#{product.name}: $#{product.price}"
end