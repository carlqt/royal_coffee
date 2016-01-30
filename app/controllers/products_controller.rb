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
#

class ProductsController < ApplicationController
  respond_to :html, :json

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end
end
