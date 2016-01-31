# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  drink_type   :integer
#  name         :string
#  tall_price   :decimal(, )
#  venti_price  :decimal(, )
#  grande_price :decimal(, )
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
