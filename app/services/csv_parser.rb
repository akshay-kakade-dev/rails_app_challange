require 'csv'

class CsvParser
  def parse(file:)
    CSV.read(file.path, headers:true, header_converters: :symbol,
      converters: :all).collect { |row| row.to_h }
  end
end