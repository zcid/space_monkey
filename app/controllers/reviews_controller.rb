class ReviewsController < ApplicationController
  before_action :set_product, only: [:new, :update, :create, :destroy, :edit]
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
  	@reviews = Review.all
  end

  def show	
  end

  def edit
  end

  def new
  	@review = @product.reviews.build
  end

  def create
  	@review = @product.reviews.build(review_params)
  	if @review.save
  		redirect_to @product
  	else
  		render :new
  	end
  end

  def update
  	if @review.update_attributes(review_params)
  		redirect_to @product
  	else
  		render :edit
  	end
  end

  def destroy
  	  @review.destroy
      redirect_to @product
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_review
    	@review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :description)   
    end


end
