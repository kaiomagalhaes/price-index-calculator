require 'spec_helper'

describe Price::Index::Calculator do

  let(:calculator) do 
      obj = Object.new
      obj.extend Price::Index::Calculator
      obj
  end

  it 'has a version number' do
    expect(Price::Index::Calculator::VERSION).not_to be nil
  end

  describe "test price_index_list" do
    it 'price_index_list with empty list return empty list' do
      expect(calculator.price_index_list []).to eq([])
    end

    it 'price_index_list with nil list return empty list' do
      expect(calculator.price_index_list nil).to eq([])
    end
  end

  describe "test price_index"do

    it 'With new_product nil return empty hash' do
      expect(calculator.price_index nil, nil).to eq(Hash.new)
    end

    it 'With new_product nil return empty hash' do
      expect(calculator.price_index nil, nil).to eq(Hash.new)
    end

    it 'With old_product nil return new_product' do
      new_product = {amount: 2, price: 2.8}
      new_product_with_price_index = new_product.clone
      new_product_with_price_index[:price_index] = 100
      expect(calculator.price_index new_product , nil).to eq(new_product_with_price_index)
    end

     it 'With valid products return correct value' do
      new_product = {amount: 2, price: 3.0}
      old_product = {amount: 2, price: 2.0}
      new_product_with_price_index = new_product.clone
      new_product_with_price_index[:price_index] = 150
      expect(calculator.price_index new_product , old_product).to eq(new_product_with_price_index)
    end

  end
end
