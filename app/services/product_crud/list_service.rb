module ProductCrud
  class ListService
    attr_reader :repository
  
    def initialize(repository:)
      @repository = repository
    end
  
    def list(list_params:)
      repository.list(list_params: list_params)
    end
  end
end