class ProcessProductCsvSaveToDbJob
  include Sidekiq::Job

  def perform(csv_parser:, file:)
    # Do something
    product_data = csv_parser.parse(file: file)
    
  end
end
