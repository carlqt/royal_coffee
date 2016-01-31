# == Schema Information
#
# Table name: table_items
#
#  id             :integer          not null, primary key
#  size           :string
#  price          :decimal(, )
#  drink_type     :integer
#  table_order_id :integer
#  product_id     :integer
#  name           :string
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

describe :table_item do
  describe ".create" do
    let!(:product) { create :product }
    let!(:table) { create :customer_table }

    before do
      table.add_item product_id: product.id, name: product.name
    end

    it "uses product table to fill in attributes" do
      expect(TableItem.first.drink_type).to eq product.drink_type
    end
  end
end
