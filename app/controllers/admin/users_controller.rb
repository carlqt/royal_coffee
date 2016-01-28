class Admin::UsersController < ApplicationController
  def index
    @all_products = Product.all
    @products = Product.new
  end
end
