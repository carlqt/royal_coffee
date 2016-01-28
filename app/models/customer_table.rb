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
  has_many :order_items, through: :orders
  has_many :orders
end
