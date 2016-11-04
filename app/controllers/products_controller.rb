class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all.order(created_at: :desc)
    @order_item = current_order.order_items.new
    @total_products = Product.all.count
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
    @images = @product.images
    render :show
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy 
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :product_id, :price, :description, :status, :image, :user_id)
  end
end
