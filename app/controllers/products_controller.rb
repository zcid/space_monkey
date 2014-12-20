class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all.sort { |x,y| y.get_score <=> x.get_score }
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def vote_up
    product = Product.find(params[:product])
    product.scores.create(user_id: current_user.id, user_score: 1)
    redirect_to root_path
  end

  def vote_down
    product = Product.find(params[:product])
    product.scores.create(user_id: current_user.id, user_score: (-1))
    redirect_to root_path
  end

  private 
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description)
    end

    def get_score(product)
      x = 0
      product.scores.each do |score|
        x += score.user_score
      end
      return x
    end
end
