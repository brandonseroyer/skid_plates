class CarsController < ApplicationController
  def index
    @cars = Car.all
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
