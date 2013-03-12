class ReviewsController < ApplicationController
  respond_to :json
  
  def update
    @review = Review.find(params[:id])
    @review.update_attributes(params[:review])
    respond_with @review
  end
end
