require 'rails_helper'

describe ProductDecorator do
  describe '#available_types' do
    let(:product) { ProductDecorator.new(create(:product)) }
    it "returns an array of available sizes" do
      expect(product.available_types).to match_array(%w(tall venti grande))
    end

    context "when venti_price is nil" do
      let(:product) { ProductDecorator.new(create(:product, venti_price: nil)) }
      it "returns only Tall and Grande" do
        expect(product.available_types).to match_array(%w(tall grande))
      end
    end
  end

  describe '.wrap' do
    let(:products) do
      5.times.map{ create :product }
    end

    it "wraps the ProductDecorator to all objects in the collection" do
      expect(products_decor_check).to be true
    end
  end

  private

  def products_decor_check
    products_decor = ProductDecorator.wrap(products)
    products_decor.map{ |prod| prod.is_a?(ProductDecorator)}.all?
  end
end