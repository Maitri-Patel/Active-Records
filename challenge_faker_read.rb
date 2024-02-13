load 'ar.rb'
# Establish connection  sqlite3 database.
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

class Category < ActiveRecord::Base
  has_many :products
end

class Product < ActiveRecord::Base
  belongs_to :category
end

categories = Category.all

categories.each do |category|
  puts "Category: #{category.name}"

 
  category.products.each do |product|
    puts "  Product: #{product.name}, Price: #{product.price}"
  end

  puts "\n"  
end
