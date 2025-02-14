class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[index new create]

  def index
    @reviews = Review.where(restaurant_id: @restaurant.id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review successfully created!"
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.delete
      redirect_to restaurant_path(@review.restaurant)
    else
      render :destroy, status: unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
