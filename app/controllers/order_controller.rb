class OrderItemsController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @order = Order.new
    @order_items = current_order.order_items
    @shipping = 10.00
    @sub_total = @order_items.map(&:total_price).sum + @shipping
    render :new
  end

  def create
    @order.new(order_params)
    if verify_recaptcha
      @order.save
      render :show
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = current_order.order_items
    @shipping = 10.00
    @sub_total = @order_items.map(&:total_price).sum + @shipping
    render :show
  end

  def destroy
    @order = Order.find(params[:id])
    @order = Order.destroy
    redirect_to orders_path
  end

private

  def order_params
    params.require(:order).permit(:subtotal, :shipping, :first_name, :last_name, :delivery_first_name, :delivery_last_name, :address, :city, :state, :zip, :country, :phone)
  end
end
