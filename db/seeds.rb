[
  { product_name: "Mechanical Keyboard", product_type: "Electronics", count: 50 },
  { product_name: "Wireless Mouse", product_type: "Electronics", count: 30 },
  { product_name: "Standing Desk", product_type: "Furniture", count: 12 },
  { product_name: "Monitor Arm", product_type: "Furniture", count: 25 },
  { product_name: "USB-C Hub", product_type: "Accessories", count: 40 },
  { product_name: "Noise-Canceling Headphones", product_type: "Electronics", count: 18 },
].each do |attrs|
  Product.find_or_create_by!(product_name: attrs[:product_name]).update!(attrs)
end
