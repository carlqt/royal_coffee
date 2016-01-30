class CustomerTablesController < ApplicationController
  before_action :undelivered_items, only: [:current_order, :confirm_order]
  before_action :delivered_items, only: [:total_order]

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
  end

  def total_order
  end

  def confirm_order
    @order_items.each(&:deliver!)
    redirect_to customer_table_path params[:id]
  end

  def pay_order
  end

  private

  def undelivered_items
    @order_items = TableItem.from_table(params[:id]).not_delivered
  end

  def delivered_items
    @order_items = TableItem.from_table(params[:id]).delivered
  end

  def item_params
    params[:price] = params[:price].gsub('$', '')
    params.permit(:product_id, :price)
  end
end
