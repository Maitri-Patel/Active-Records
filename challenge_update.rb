
require 'rubygems'
require 'bundler/setup'
require 'active_record'

# Load the ActiveRecord model(s).
require_relative 'models/product'  # Make sure the file path is correct

# Establish our connection to our serverless sqlite3 database.
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

# Define the Product class
class Product < ActiveRecord::Base
end

# Find all products with a stock quantity greater than 40
products_to_update = Product.where('stock_quantity > 40')

puts 'Products before update:'
products_to_update.each do |product|
  puts "Product: #{product.name}, Stock Quantity: #{product.stock_quantity}"
end

# Add one to the stock quantity of each product and save the changes
products_to_update.each do |product|
  product.stock_quantity += 1
  product.save
end

puts "\nProducts after update:"
products_to_update.reload  # Reload to fetch the updated data from the database
products_to_update.each do |product|
  puts "Product: #{product.name}, Updated Stock Quantity: #{product.stock_quantity}"
end

puts 'Stock quantities updated successfully!'
