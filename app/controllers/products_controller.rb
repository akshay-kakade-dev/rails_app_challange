class ProductsController < ApplicationController
  before_action :load_user

  def index
    service = Resolver.list_product_service
    render json: service.list(list_params: list_params)
  end

  def create
    service = Resolver.create_product_service    
    product = service.create(product_params: product_params)

    if product.valid?
      render json: { message: "product is purchased", data: {product_id: product.id} }, status: 201
    else
      render json: { message: product.errors.full_messages.join(",") }, status: 422
    end
  end

  def upload
    ProcessProductCsvSaveToDbJob.perform_async("product.csv")
  end

  private

  def list_params
    params.permit(:id, :page, :page_size)
  end

  def load_user
    @user = User.find(params[:id])
  end

  def product_params
    params.permit(:id, product: [:category, :price, :name, :manufacturer])
  end
end
