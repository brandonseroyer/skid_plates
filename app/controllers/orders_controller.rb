class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(created_at: :desc)
    @order_items = current_order.order_items

  end

  def new
    @order = Order.new
    @order_items = current_order.order_items
    @shipping = 10.00
    @sub_total = @order_items.map(&:total_price).sum + @shipping
    render :new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render :show
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    render :show
  end

  def edit
    @order = Order.find(params[:id])
    render :edit
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    render :show
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

private

  def order_params
    params.require(:order).permit(:subtotal, :shipping, :first_name, :last_name, :email, :delivery_first_name, :delivery_last_name, :address, :city, :state, :zip, :country, :phone)
  end
end
