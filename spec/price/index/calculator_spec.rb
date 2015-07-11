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

end
