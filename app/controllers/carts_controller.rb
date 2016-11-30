class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @shipping = 10.00
    @sub_total = @order_items.map(&:total_price).sum + @shipping
  end
end
