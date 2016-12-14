class CarsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @cars = Car.all.order(created_at: :desc)
  end

  def new
    @car = Car.new
    render :new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def show
    @car = Car.find(params[:id])
    @products = Product.search(@car.name)
    @order_item = current_order.order_items.new
    render :show
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :year, :image)
  end
end
