class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
      @drink=Drink.find(params[:drink_id])
      @reviews=Review.where(drink_id: params[:drink_id],star: params[:star])
  end

  def create
    @review = Review.new(rewiew_params)
    @review.user_id = current_user.id
    @review.drink_id = params[:drink_id]
    if @review.save
      redirect_to drink_path(@review.drink), notice: "You have created review successfully."
    else
      @reviews=Review.where(drink_id: params[:drink_id])
      @drink=Drink.find(params[:drink_id])
      if @reviews.empty?
        @average=0
      else
        @average=Review.where(drink_id: params[:drink_id]).average(:star).round(2)
      end
      render 'drinks/show'
    end
  end

  def destroy
  end

  private

  def rewiew_params
    params.require(:review).permit(:star, :body)
  end
end
