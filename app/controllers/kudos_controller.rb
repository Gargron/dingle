class KudosController < ApplicationController
  def create
    if current_user.new_record? && current_user.save
      session[:user_id] = current_user.id
      mixpanel.append_people_identify current_user.id
    end

    rating = Rating.find(params[:rating_id])
    kudo   = Kudo.new(rating_id: params[:rating_id])
    kudo.user_id = current_user.id
    kudo.save

    mixpanel.append_track 'Kudos Given'
    redirect_to [rating.provider.country, rating.provider, rating]
  end
end
