module ProductCrud
  class CreateService
    attr_reader :repository
  
    def initialize(repository:)
      @repository = repository
    end
  
    def create(product_params:)
      repository.create(product_params: product_params)
    end
  end
end