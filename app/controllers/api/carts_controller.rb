module Api
  class CartsController < ApplicationController
    def show
      render json: cart_json(current_cart)
    end

    def add_item
      product = Product.find(params[:product_id])
      item = current_cart.cart_items.find_or_initialize_by(product: product)
      item.quantity = (item.quantity || 0) + params.fetch(:quantity, 1).to_i
      item.save!

      render json: cart_json(current_cart)
    end

    private

    def current_cart
      cart_id = session[:cart_id]
      cart = cart_id ? Cart.find_by(id: cart_id) : nil
      cart ||= Cart.create!
      session[:cart_id] = cart.id
      cart
    end

    def cart_json(cart)
      {
        id: cart.id,
        items: cart.cart_items.includes(:product).map do |item|
          {
            id: item.id,
            product_id: item.product_id,
            product_name: item.product.product_name,
            quantity: item.quantity,
            price: item.product.price,
            image_url: item.product.image_url,
          }
        end
      }
    end
  end
end
