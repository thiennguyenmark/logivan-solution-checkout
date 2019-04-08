require 'spec_helper'

describe Product do
  describe 'attributes' do
    let(:product) { Product.new('001', 'Macbook Pro 2018', 2000) }

    it 'returns attributes' do
      expect(product.respond_to?(:name)).to be true
      expect(product.respond_to?(:product_code)).to be true
      expect(product.respond_to?(:price)).to be true
    end

    context 'new product with information' do
      it 'returns the right information' do
        expect(product.product_code).to eq('001')
        expect(product.name).to eq('Macbook Pro 2018')
        expect(product.price).to eq(2000)
      end
    end

    context 'valid product' do
      it 'returns success? with true value' do
        expect(product.errors).to eq([])
        expect(product.success?).to be true
      end
    end
  end
end
