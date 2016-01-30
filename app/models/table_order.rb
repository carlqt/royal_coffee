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
end
