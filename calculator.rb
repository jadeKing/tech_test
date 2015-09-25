def calculate_rate(rates, request)
    amounts = rates.sort_by(&:first)
    temp = []
    loan_count = 0
    # i = 0
    # begin
    #   loan_count = loan_count + amounts[i][1]
    #   temp.push(amounts[i])
    #   i = i + 1
    # end until loan_count > request
    sum = 0
    amounts.each do |x, y|
      loan_count = loan_count + y
      sum = sum + x
      temp.push([x,y])
      break if loan_count > request
    end
    # temp.each { |x, y| sum = sum + x }
    result = (sum / temp.length * 100).round(1)
    # result.round(1)
end
