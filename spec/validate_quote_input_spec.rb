require './calculator'
require './quote_app'
require 'csv'

describe 'Validate quote input' do
  let(:q) { QuoteApp.new { include ValidateQuoteInput } }

  it 'checks that amount input is multiple of 100' do
    expect(q.validate_multiple_of_100(200)).to eq true
  end

  it 'shows error if amount input is not multiple of 100' do
    expect(q.validate_multiple_of_100(250)).to eq false
  end

  it 'checks that amount is between 1000 & 15000' do
    expect(q.validate_amount_limits(1250)).to eq true
  end

  it 'shows error if amount input is below 1000' do
    expect(q.validate_amount_limits(250)).to eq false
  end

  it 'shows error if amount input is above 15000' do
    expect(q.validate_amount_limits(20000)).to eq false
  end

  it 'validates file is csv format' do
    expect(q.validate_file_format('market.csv')).to eq true
  end

  it 'shows error is file is not csv format' do
    expect(q.validate_file_format('market.txt')).to eq false
  end


end
