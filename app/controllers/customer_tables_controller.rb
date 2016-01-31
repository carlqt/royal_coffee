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
  before_action :undelivered_items, only: [:current_order, :confirm_order]
  before_action :customer_table, only: [:add_item, :pay_order]

  def assign_table
    redirect_to customer_table_path(params[:table_number])
  end

  def show
    @products = ProductDecorator.wrap Product.all
  end

  def add_item
    @table.add_item(item_params)
    respond_to do |format|
      format.js { render 'add_item.js.erb' }
    end
  end

  def current_order

  end

  def total_order
    if customer_table.table_order
      @order_items = TableItem.from_table(params[:id]).delivered
    else
      @order_items = TableItem.none
    end
  end

  def confirm_order
    @order_items.each(&:deliver!)
    redirect_to customer_table_path params[:id]
  end

  def pay_order
    @table.table_order.pay!
    redirect_to customer_table_path params[:id]
  end

  private

  def customer_table
    @table = CustomerTable.find params[:id]
  end

  def undelivered_items
    @order_items = TableItem.from_table(params[:id]).not_delivered
  end

  def item_params
    params[:price] = params[:price].gsub('$', '')
    params.permit(:product_id, :price, :size)
  end
end
