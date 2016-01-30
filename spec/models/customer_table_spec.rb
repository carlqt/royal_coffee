# == Schema Information
#
# Table name: customer_tables
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe :customer_table do
  describe ".add_item" do
    context "when there is no associated table_orders" do
      let(:table) { create :customer_table }
      let(:product) { create(:product) }
      it "creates a new table_order object associated with customer_table" do
        table.add_item(product_id: product.id)
        expect(table.table_orders).to_not be_empty
      end

      it "creates a table_item" do
        expect{table.add_item(product_id: product.id)}.to change{TableItem.count}.by(1)
      end
    end

    context "when there is no unpaid table_orders" do
      let!(:table) { create :customer_table }
      let!(:product) { create(:product) }

      before do
        table.add_item(product_id: product.id)
        table.table_orders.first.update_attribute :status, 1
      end

      it "creates a new table_order object associated with customer_table" do
        table.add_item(product_id: product.id)
        expect(TableOrder.count).to eq 2
      end

      it "creates a table_item" do
        expect{table.add_item(product_id: product.id)}.to change{TableItem.count}.by(1)
      end
    end
  end

  describe ".table_items" do
    context "when there are two or more table_order object" do
      before do
        product = create :product
        table = create(:customer_table)
        table.add_item(product_id: product.id, price: product.venti_price)
        TableOrder.first.update_attribute :status, 1
        table.add_item(product_id: product.id, price: product.venti_price)
      end

      it "returns all table item objects that are under an unpaid Order" do
        table_item = TableItem.last
        order = table_item.table_order
        expect(order.status).to eq "unpaid"
        expect(TableOrder.first.status).to eq "paid"
      end
    end
  end
end
