module FormatCsv

  def format_file(file)
    csv = CSV::parse(File.open(file, 'r') {|f| f.read })
    fields = csv.shift
    csv = csv.collect { |lender| Hash[*fields.zip(lender).flatten ] }
  end

end
