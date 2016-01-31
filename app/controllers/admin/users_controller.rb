class Admin::UsersController < ApplicationController
  def index
    @all_products = Product.all
  end

  def summary
    @dates_of_sales = TableOrder.dates_of_sales
  end
end
