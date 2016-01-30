class ProductsController < ApplicationController
  respond_to :html, :json

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end
end