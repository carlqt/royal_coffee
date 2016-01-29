class CustomerTablesController < ApplicationController
  def assign_table
    redirect_to customer_table_path(params[:table_number])
  end

  def show
    @products = Product.all
  end
end
