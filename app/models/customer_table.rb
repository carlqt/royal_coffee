# == Schema Information
#
# Table name: customer_tables
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CustomerTable < ActiveRecord::Base
  has_many :table_items, through: :table_orders
  has_many :table_orders

  def add_item(params={})
    CustomerTable.transaction do
      order = table_orders.find_or_create_by(customer_table_id: id, status: 0)
      order.table_items.create(params)
    end
  end

  def table_order
    table_orders.find_by(status: 0)
  end
end
