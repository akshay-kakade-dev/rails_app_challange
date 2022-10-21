module ProductCrud
  class Repository
    attr_reader :user
  
    def list(list_params:)
      user = find_user(user_id: list_params[:id])
      user.products.order(updated_at: :desc).limit(list_params[:page_size]).offset((list_params[:page].to_i - 1) * list_params[:page_size].to_i)
    end

    def create(product_params:)
      user = find_user(user_id: product_params[:id])
      user.products.create(product_params[:product])
    end
  
    private
  
    def find_user(user_id:)
      @user ||= User.find(user_id)
    end
  end
end