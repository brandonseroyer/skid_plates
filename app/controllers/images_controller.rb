class ImagesController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @image = @product.images.new
  end

  def create
    @product = Product.find(params[:product_id])
    @image = @product.images.new(image_params)
    if @image.save
      redirect_to product_path(@image.product)
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
    redirect_to product_path(@image.product)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to product_path(@image.product)
  end

  private
  def image_params
    params.require(:image).permit(:avatar)
  end
end
