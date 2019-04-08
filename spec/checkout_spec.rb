require 'spec_helper'

describe Checkout do
  describe 'attributes' do
    let(:product1) do
      Product.new('001', 'P1', 9.25)
    end
    let(:product2) do
      Product.new('002', 'P2', 45)
    end
    let(:product3) do
      Product.new('003', 'P3', 19.95)
    end
    let(:promotional_rule1) do
      PromotionalRule.new(
        rule_type: :discount_on_total_price,
        discount: 0.1,
        min_total_price: 60
      )
    end
    let(:promotional_rule2) do
      PromotionalRule.new(
        rule_type: :discount_on_total_item,
        discount: 8.5,
        products: [product1],
        min_order: 2
      )
    end
    let(:checkout) do
      Checkout.new(
        [promotional_rule1, promotional_rule2]
      )
    end

    context '001, 002, 003' do
      let(:item1) { Item.new(product1, 1) }
      let(:item2) { Item.new(product2, 1) }
      let(:item3) { Item.new(product3, 1) }

      before do
        checkout.items = [item1, item2, item3]
      end

      it 'returns 66.78' do
        checkout.items.each do |item|
          checkout.scan(item)
        end

        expect(checkout.total).to eq(66.78)
      end
    end

    context '001, 003, 001' do
      let(:item1) { Item.new(product1, 2) }
      let(:item3) { Item.new(product3, 1) }

      before do
        checkout.items = [item1, item3]
      end
      it 'returns 36.95' do
        checkout.items.each do |item|
          checkout.scan(item)
        end

        expect(checkout.total).to eq(36.95)
      end
    end

    context '001, 002, 001, 003' do
      let(:item1) { Item.new(product1, 2) }
      let(:item2) { Item.new(product2, 1) }
      let(:item3) { Item.new(product3, 1) }

      before do
        checkout.items = [item1, item2, item3]
      end
      it 'returns 73.76' do
        checkout.items.each do |item|
          checkout.scan(item)
        end

        expect(checkout.total).to eq(73.76)
      end
    end
  end
end
