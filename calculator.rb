def calculate_rate(rates, request)
    amounts = rates.sort_by(&:first)
    temp = []
    loan_count = 0
    sum = 0
    amounts.each do |x, y|
      loan_count = loan_count + y
      sum = sum + x
      temp.push([x,y])
      break if loan_count > request
    end
    result = (sum / temp.length * 100).round(1)
end