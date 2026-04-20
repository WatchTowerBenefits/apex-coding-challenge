module Api
  class CartsController < ApplicationController
    def show
      render json: cart_json(current_cart)
    end

    def add_item
      cart = current_cart
      product = Product.find(params[:product_id])
      item = cart.cart_items.find_by(product_id: product.id)

      if item
        item.update!(quantity: item.quantity + (params[:quantity] || 1).to_i)
      else
        cart.cart_items.create!(product: product, quantity: (params[:quantity] || 1).to_i)
      end

      render json: cart_json(cart.reload)
    end

    private

    def current_cart
      if session[:cart_id]
        Cart.find_by(id: session[:cart_id]) || create_cart
      else
        create_cart
      end
    end

    def create_cart
      cart = Cart.create!
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
            image_url: item.product.image_url
          }
        end
      }
    end
  end
end
