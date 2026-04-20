module Api
  class CartsController < ApplicationController
    def show; end

    # find a Product, add it to the current cart and increment quantity
    def add_item; end

    private

    # find or create the current cart based on ID from session
    def current_cart; end

    # serialize response
    def cart_json(cart); end
  end
end
