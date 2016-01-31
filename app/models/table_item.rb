# == Schema Information
#
# Table name: table_items
#
#  id             :integer          not null, primary key
#  quantity       :integer
#  price          :decimal(, )
#  drink_type     :integer
#  table_order_id :integer
#  product_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TableItem < ActiveRecord::Base
  belongs_to :table_order
  belongs_to :product
  validates :table_order, presence: true

  before_create :get_attributes
  scope :from_table_order, ->(order_id) { where(table_order_id: order_id) }
  scope :delivered, ->{ where(status: 0) }
  scope :not_delivered, ->{ where(status: 1) }
  scope :from_table, ->(num) { joins(:table_order).where("table_orders.customer_table_id = ? AND table_orders.status = '0'", num) }

  enum status: { not_delivered: 0, delivered: 1 }
  enum drink_type: { coffee: 0, tea: 1 }

  def deliver!
    self.status = 1
    self.save
  end

  def self.clean!
    not_delivered.delete_all
  end

  private

  def get_attributes
    self.drink_type = product.drink_type
    self.name = product.name
  end
end
