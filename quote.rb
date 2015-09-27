class Quote

  attr_reader :rate, :monthly, :overall

  def initialize(options = {})
    @rate = options[:rate]
    @monthly = options[:monthly]
    @overall = options[:overall]
  end

  def display_quote
    "Rate: #{@rate.round(1)}% \nMonthly repayment: £#{@monthly.round(2)} \nOverall repayment: £#{@overall.round(2)}"
  end

end
