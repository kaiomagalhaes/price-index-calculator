require 'spec_helper'


describe Price::Index::Laspeyres do

  let(:calculator) do
    obj = Object.new
    obj.extend Price::Index::Laspeyres
    obj
  end

  let(:data) do
  end

  describe "test price_index_list with" do

    describe "invalid data" do
      it 'empty input returns empty list' do
        expect(calculator.calc []).to eq([])
      end

      it 'nil input returns empty list' do
        expect(calculator.calc nil).to eq([])
      end

      it 'periods null raise error' do
        expect {calculator.calc calculator.calc({"test":"fail"})}.to raise_error(ArgumentError)
      end
    end

    describe "valid value returns valid list" do
      it 'Valid list return correct list of products with index' do
        data = get_json("spec/resources/data.json")
        data_with_laspeyres_index = get_json("spec/resources/laspeyres_index.json")
        expect(calculator.calc(data)).to be_eql(data_with_laspeyres_index)
      end
    end

  end
end
