class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def show
    @order_items = @order.order_items
    @shipping = 10.00
    @sub_total = @order_items.map(&:total_price).sum + @shipping
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    @shipping = 10.00
    @sub_total = @order_items.map(&:total_price).sum + @shipping
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    @shipping = 10.00
    @sub_total = @order_items.map(&:total_price).sum + @shipping
  end

private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
