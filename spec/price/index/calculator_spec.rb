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
    it 'With empty list return empty list' do
      expect(calculator.price_index_list []).to eq([])
    end

    it 'With nil list return empty list' do
      expect(calculator.price_index_list nil).to eq([])
    end

    it 'With valid list return correct list of products with index' do
     skip 
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
      new_product = product 2, 2.0
      new_product_with_price_index = new_product.clone
      new_product_with_price_index[:price_index] = 100
      expect(calculator.price_index new_product , nil).to eq(new_product_with_price_index)
    end

    it 'With valid products return correct value' do
      new_product = product 2, 3.0
      old_product = product 2, 2.0
      new_product_with_price_index = new_product.clone
      new_product_with_price_index[:price_index] = 150
      expect(calculator.price_index new_product , old_product).to eq(new_product_with_price_index)
    end

    it 'With products with diferent amounts will use the amount of the old' do
      new_product = product 10, 3.0
      old_product = product 2 , 2.0
      new_product_with_price_index = new_product.clone
      new_product_with_price_index[:price_index] = 150
      expect(calculator.price_index new_product , old_product).to eq(new_product_with_price_index)
    end

    it 'With products with no value for :price will raise an exception' do
      valid_product = product 10,20
      invalid_product = product 2, nil

      expect{calculator.price_index invalid_product, valid_product}.to raise_error(ArgumentError)
      expect{calculator.price_index valid_product,invalid_product }.to raise_error(ArgumentError)
    end

    it 'With products with no value for :amount will raise an exception' do
      valid_product = product 10,20
      invalid_product = product nil, 20

      expect{calculator.price_index invalid_product, valid_product}.to raise_error(ArgumentError)
      expect{calculator.price_index valid_product,invalid_product }.to raise_error(ArgumentError)
    end
  end

  private

  def product(amount,price, *price_index)
    {amount: amount, price: price, price_index: price_index}
  end

end
