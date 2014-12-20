class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(project_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(project_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private 
    def set_product
      @product = Product.find(params[:id])
    end

    def project_params
      params.require(:product).permit(:name, :description)
    end

end
