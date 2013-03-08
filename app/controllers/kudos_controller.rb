class KudosController < ApplicationController
  def create
    if current_user.new_record? && current_user.save
      session[:user_id] = current_user.id
    end

    rating = Rating.find(params[:rating_id])
    kudo   = Kudo.new(rating_id: params[:rating_id])
    kudo.user_id = current_user.id
    kudo.save

    redirect_to rating
  end
end
