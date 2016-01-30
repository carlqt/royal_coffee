# == Schema Information
#
# Table name: customer_tables
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CustomerTablesController < ApplicationController
  def assign_table
    redirect_to customer_table_path(params[:table_number])
  end

  def show
    @products = ProductDecorator.wrap Product.all
  end

  def add_item
    @table = CustomerTable.find params[:id]
    @table.add_item(item_params)
    respond_to do |format|
      format.js { render 'add_item.js.erb' }
    end
  end

  def current_order
    table = CustomerTable.find params[:id]
    @order_items = table.table_items.unpaid
  end

  private

  def item_params
    params[:price] = params[:price].gsub('$', '')
    params.permit(:product_id, :price)
  end
end
