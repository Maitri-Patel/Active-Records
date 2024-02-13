load 'ar.rb'

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

# Loop to generate 10 new categories
10.times do
  category = Category.create(
    name: Faker::Commerce.unique.department
  )

  # Loop to create 10 new products for each category
  10.times do
    Product.create(
      name: Faker::Commerce.unique.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(range: 0.5..100.0),
      stock_quantity: Faker::Number.between(from: 1, to: 100),
      category: category
    )
  end
end

puts 'Faker data created successfully!'
