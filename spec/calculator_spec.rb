require './calculator'
require './quote_app'
require 'csv'

describe 'Calculator' do
  # before(:each) do
  #   rates = [{"Lender"=>"Bob", "Rate"=>"0.071", "Available"=>"640"},
  #            {"Lender"=>"Jane", "Rate"=>"0.069", "Available"=>"480"}]
  #   amount = 1000
  # end

  describe 'Quote Calculator' do
    let(:q) { QuoteApp.new { include Calculator } }

    it 'calculates best rate' do
      rates = [{"Lender"=>"Bob", "Rate"=>"0.071", "Available"=>"640"},
               {"Lender"=>"Jane", "Rate"=>"0.069", "Available"=>"480"}]
               amount = 1000

      result = q.calculate_quote(rates, amount)
      expect(result[:rate].round(1)).to eq 7.0
    end

    it 'calculates monthly repayments' do
      rates = [{"Lender"=>"Bob", "Rate"=>"0.071", "Available"=>"640"},
               {"Lender"=>"Jane", "Rate"=>"0.069", "Available"=>"480"}]
      rate = 7.0
      amount = 1000
      result = q.calculate_quote(rates, amount)
      expect(result[:monthly].round(2)).to eq 34.25
    end

    it 'calculates overall repayments' do
      rates = [{"Lender"=>"Bob", "Rate"=>"0.071", "Available"=>"640"},
               {"Lender"=>"Jane", "Rate"=>"0.069", "Available"=>"480"}]
      amount = 1000
      result = q.calculate_quote(rates, amount)
      expect(result[:overall].round(2)).to eq 1232.93
    end
  end
end
