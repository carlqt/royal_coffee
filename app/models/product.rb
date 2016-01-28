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
end
