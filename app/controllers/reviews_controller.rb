class ReviewsController < ApplicationController
  respond_to :json
  
  def update
    @review = Review.find(params[:id])

    if current_user.id != @review.user_id
      redirect_to root_path and return
    end
    
    @review.update_attributes(params[:review])
    respond_with @review
  end
end
