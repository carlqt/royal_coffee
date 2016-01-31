require 'rails_helper'

describe TableItemDecorator do
  describe ".merge" do
    let(:table) { create :customer_table }
    before do
      product = create :product, name: "Mocha"
      5.times do 
        table.add_item(product_id: product.id, price: product.tall_price, size: "tall")
      end
    end

    it "returns a collection of OpenStruct object" do
      item_decorator = TableItemDecorator.merge(TableItem.all)
      item_decorator.each do |item|
        expect(item.is_a?(OpenStruct)).to eq true
      end
    end

    it "combines similar table items" do
      item_decorator = TableItemDecorator.merge(TableItem.all)
      expect(item_decorator.count).to eq 1
    end

    it "adds the combined objects into quantity" do
      item_decorator = TableItemDecorator.merge(TableItem.all)
      expect(item_decorator.first.quantity).to eq 5
    end
  end
end