module Calculator

  def calculate_quote(rates = {}, request_amount)
    rate = calculate_rate(rates, request_amount.to_f)
    result = nil
    unless rate == false
      overall = calculate_overall_repayment(rate, request_amount.to_f)
      monthly = calculate_monthly_repayments(overall)
      result = { rate:rate,
                 monthly: monthly,
                 overall: overall }
    end
    result
  end

  def calculate_rate(rates, request_amount)
      amounts = rates.sort_by { |x| x["Rate"].to_f }
      temp = []
      loan_count = 0
      sum = 0
      amounts.each do |n|
        loan_count = loan_count + n["Available"].to_f
        sum = sum + n["Rate"].to_f
        temp.push([n])
        break if loan_count > request_amount
      end
      loan_count < request_amount ? false : (sum / temp.length * 100)
  end

  private

  def calculate_overall_repayment(rate, request_amount)
    rate = rate /100.00
    (request_amount * (1 + rate/12)**36)
  end

  def calculate_monthly_repayments(overall_amount)
    (overall_amount / 36)
  end

end
