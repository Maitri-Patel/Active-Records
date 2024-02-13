require_relative 'ar'

product_to_delete = Product.find_by(name: "apple juice")

# Check if the product exists before attempting to delete it
if product_to_delete
  product_to_delete.destroy
  puts "Product '#{product_to_delete.name}' deleted successfully."
else
  puts "Product 'Avocado' not found."
end
