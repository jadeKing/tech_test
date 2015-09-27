module ValidateQuoteInput
  def validate_multiple_of_100(amount)
    amount.to_i % 100 == 0
  end

  def validate_amount_limits(amount)
    amount.to_i >= 1000 && amount.to_i <= 15000
  end

  def validate_file_format(file)
    file = File.new(file)
    File.extname(file) == '.csv'
  end

  def validate_input(amount, file)
    result = nil
    result = "Invalid file format(Must be csv)" if validate_file_format(file) != true
    result = "Invalid Input(Must be a multiple 100)" if validate_multiple_of_100(amount) != true
    result = "Invalid Input(Amount must be between 1000 & 15000)" if validate_amount_limits(amount) != true
    result
  end
end
