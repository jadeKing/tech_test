require 'format_csv'
require 'quote_app'

describe 'format csv' do
  let(:q) { QuoteApp.new { include FormatCsv } }

  it 'formats the data into a hash' do
    expected = [{"Lender"=>"Bob", "Rate"=>"0.075", "Available"=>"640"}, {"Lender"=>"Jane", "Rate"=>"0.069", "Available"=>"480"}, {"Lender"=>"Fred", "Rate"=>"0.071", "Available"=>"520"}, {"Lender"=>"Mary", "Rate"=>"0.104", "Available"=>"170"}, {"Lender"=>"John", "Rate"=>"0.081", "Available"=>"320"}, {"Lender"=>"Dave", "Rate"=>"0.074", "Available"=>"140"}, {"Lender"=>"Angela", "Rate"=>"0.071", "Available"=>"60"}]
    expect(q.format_file('market.csv')).to eq expected
  end
end
