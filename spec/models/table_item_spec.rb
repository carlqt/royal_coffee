require 'rails_helper'

describe :table_item do
  describe ".create" do
    let!(:product) { create :product }
    let!(:table) { create :customer_table }

    before do
      table.add_item product_id: product.id
    end

    it "uses product table to fill in attributes" do
      expect(TableItem.first.drink_type).to eq product.drink_type
    end
  end
end
