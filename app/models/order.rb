# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  customer_table_id :integer
#  order_item_id     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Order < ActiveRecord::Base
end
