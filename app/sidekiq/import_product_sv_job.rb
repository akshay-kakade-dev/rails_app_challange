class ImportProductCsvJob
  include Sidekiq::Job

  def perform(file_path)
    file = File.open(file_path)
    product_data = CsvParser.new.parse(file: file)

    # import to product table
    result = Product.import(product_data, validates: true)

    # perform operation on failed data
    result.failed_instances
  end
end




