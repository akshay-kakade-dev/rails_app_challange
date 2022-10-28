class Resolver
  def self.list_product_service
    repository = ProductCrud::Repository.new
    ProductCrud::ListService.new(repository: repository)
  end

  def self.create_product_service
    repository = ProductCrud::Repository.new
    ProductCrud::CreateService.new(repository: repository)
  end

  def self.upload_product_csv_to_table
    csv_parser = CsvParser.new
    ProcessProductCsvSaveToDbJob
  end
end