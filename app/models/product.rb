# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  type         :string
#  name         :string
#  tall_price   :decimal(, )
#  venti_price  :decimal(, )
#  grande_price :decimal(, )
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base
  validates :venti_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :grande_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :tall_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  enum drink_type: { coffee: 0, tea: 1 }
end
