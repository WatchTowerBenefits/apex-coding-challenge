[
  { product_name: "Mechanical Keyboard", product_type: "Electronics", count: 50, price: 129.99, image_url: "https://picsum.photos/seed/keyboard/300/200" },
  { product_name: "Wireless Mouse", product_type: "Electronics", count: 30, price: 49.99, image_url: "https://picsum.photos/seed/mouse/300/200" },
  { product_name: "Standing Desk", product_type: "Furniture", count: 12, price: 599.00, image_url: "https://picsum.photos/seed/desk/300/200" },
  { product_name: "Monitor Arm", product_type: "Furniture", count: 25, price: 89.99, image_url: "https://picsum.photos/seed/monitorarm/300/200" },
  { product_name: "USB-C Hub", product_type: "Accessories", count: 40, price: 39.99, image_url: "https://picsum.photos/seed/usbhub/300/200" },
  { product_name: "Noise-Canceling Headphones", product_type: "Electronics", count: 18, price: 249.99, image_url: "https://picsum.photos/seed/headphones/300/200" },
].each do |attrs|
  Product.find_or_create_by!(product_name: attrs[:product_name]).update!(attrs)
end
