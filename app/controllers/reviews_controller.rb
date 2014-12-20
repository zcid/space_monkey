class ReviewsController < ApplicationController
  before_action :set_product
  before_action :set_review

  def index
  	@reviews = Review.all
  end

  def show	
  end

  def edit
  end

  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)
  	if @review.save
  		redirect_to @review
  	else
  		render :new
  	end
  end

  def update
  	if @review.update_attributes(review_params)
  		redirect_to @review
  	else
  		render :edit
  	end
  end

  def destroy
  	  @review.destroy
      redirect_to reviews_url
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_review
    	@review = Review.find(params[:id])
  end


end
