require './quote'
require './calculator'
require 'csv'
require './format_csv'
require './validate_quote_input'

class QuoteApp
  include Calculator
  include FormatCsv
  include ValidateQuoteInput
end

def run_quote(market, amount, qa)
  csv = market
  result =  qa.calculate_quote(qa.format_file(csv), amount)
  final = result == nil ? "Not enough money for your loan" : Quote.new(result).display_quote
  puts final
end
qa = QuoteApp.new
errors = qa.validate_input(ARGV[1], ARGV[0])
errors == nil ? (run_quote(ARGV[0], ARGV[1], qa)) : (puts errors)
