require './calculator'

describe 'Calculator' do
  it 'calculates best rate' do
    rates = [[0.075, 480],[0.071, 520],[0.069, 560]]
    request = 1000
    result = calculate_rate(rates, request)
    expect(result).to eq 7.0
  end

  it 'calculates monthly repayments' do
    rate = 7.0
    amount = 1000
    result = overall_repayment(rate, amount)
    expect(result).to eq 1232.93
  end

  xit 'calculates overall repayments' do
  end

end
