class RatingsController < ApplicationController
  def create

    if current_user.new_record?
      current_user.name = params[:rating][:user][:name]

      if current_user.save
        session[:user_id] = current_user.id
      end
    else
      if params[:rating][:user][:name] != current_user.name
        current_user.name = params[:rating][:user][:name]
        current_user.save
      end
    end

    @provider    = Provider.find(params[:rating][:provider_id])
    @rating      = Rating.new(params[:rating].except(:user))
    @rating.user = current_user

    if @rating.save
      redirect_to @provider
    else
      render :template => 'providers/show'
  	end
  end

  def show
    render :nothing
  end
end
