require 'rails_helper'

describe ProductDecorator do
  describe '#available_types' do
    let(:product) { ProductDecorator.new(create(:product)) }
    it "returns an array of available sizes" do
      expect(product.available_types).to match_array(%w(Tall Venti Grande))
    end

    context "when venti_price is nil" do
      let(:product) { ProductDecorator.new(create(:product, venti_price: nil)) }
      it "returns only Tall and Grande" do
        expect(product.available_types).to match_array(%w(Tall Grande))
      end
    end
  end
end