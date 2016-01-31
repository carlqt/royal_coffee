# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  drink_type   :integer
#  name         :string
#  tall_price   :decimal(, )
#  venti_price  :decimal(, )
#  grande_price :decimal(, )
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#

class ProductsController < ApplicationController
  before_action :get_product, only: [:update, :show, :destroy, :edit]
  respond_to :html, :json

  def show
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

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_users_path
  end

  private

  def get_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit(:name, :venti_price, :tall_price, :drink_type, :grande_price)
  end
end
