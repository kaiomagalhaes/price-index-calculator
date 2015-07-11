require 'spec_helper'

describe Price::Index::Laspeyres do

  let(:calculator) do
    obj = Object.new
    obj.extend Price::Index::Laspeyres
    obj
  end

  describe "test price_index_list with" do

    describe "invalid value returns empty list" do
      it 'empty input' do
        expect(calculator.calc []).to eq([])
      end

      it 'nil input' do
        expect(calculator.calc nil).to eq([])
      end
    end

    describe "valid value returns valid list" do
      it 'Valid list return correct list of products with index' do
        skip
        expect(calculator.calc nil).to eq([])
      end
    end

  end
end
