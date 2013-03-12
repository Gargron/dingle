class RatingsController < ApplicationController
  def create
    @provider        = Provider.find(params[:provider_id])
    @rating          = Rating.new(params[:rating].except(:user))
    @rating.provider = @provider

    if current_user.new_record?
      current_user.name = params[:rating][:user][:name]

      if current_user.save
        session[:user_id] = current_user.id
      else
        render :template => 'providers/show' and return
      end

      mixpanel.append_people_identify current_user.id
    else
      if params[:rating][:user][:name] != current_user.name
        current_user.name = params[:rating][:user][:name]
        current_user.save
      end
    end
    
    @rating.user     = current_user

    if @rating.save
      mixpanel.append_track 'Rating Created'
      redirect_to [@provider.country, @provider]
    else
      render :template => 'providers/show'
  	end
  end

  def show
    @rating = Rating.find(params[:id])
  end
end
