class ProductsController < ApplicationController
  respond_to :html, :json

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :venti_price, :tall_price, :drink_type, :grande_price)
  end
end
