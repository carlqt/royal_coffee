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

  enum drink_type: { coffee: 0, tea: 1 }
  private

  def get_attributes
    self.drink_type = product.drink_type
  end
end
