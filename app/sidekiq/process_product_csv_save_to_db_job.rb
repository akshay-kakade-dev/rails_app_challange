class ProcessProductCsvSaveToDbJob
  include Sidekiq::Job

  def perform(file_path)
    # Do something
    file = File.open(file_path)
    product_data = CsvParser.new.parse(file: file)
  end
end




