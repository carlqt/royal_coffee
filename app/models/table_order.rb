# == Schema Information
#
# Table name: table_orders
#
#  id                :integer          not null, primary key
#  customer_table_id :integer
#  status            :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class TableOrder < ActiveRecord::Base
  belongs_to :customer_table
  has_many :table_items
  enum status: { unpaid: 0, paid: 1 }

  def pay!
    TableOrder.transaction do
      self.status = 1
      table_items.clean!
      save
    end
  end

  def self.dates_of_sales
    paid.map{ |order| order.created_at.to_date }.uniq
  end

  def self.receipt(date)
    order_ids = TableOrder.paid.where("DATE(created_at) = ?", date).ids
    TableItem.where(table_order_id: order_ids).delivered
  end
end
