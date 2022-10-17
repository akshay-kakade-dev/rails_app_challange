class ProductsController < ApplicationController
  before_action :load_user

  def index
    products = @user.products
    render json: products
  end

  def create
    product = @user.products.new(product_params)

    if product.save
      render json: { message: "product is purchased", data: {product_id: product.id} }, status: 201
    else
      render json: { message: product.errors.full_messages.join(",") }, status: 422
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:category, :price, :name, :manufacturer)
  end
end
