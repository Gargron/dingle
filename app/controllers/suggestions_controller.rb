class SuggestionsController < ApplicationController
  respond_to :html, :json

  def new
    @suggestion = ProviderSuggestion.new(country: Country.find(params[:country_id]))
  end

  def create
    country    = Country.find(params[:country_id])
    suggestion = ProviderSuggestion.new(params[:provider_suggestion])
    suggestion.country = country
    
    flash[:notice] = t('suggestions.thanks')

    if suggestion.save
      redirect_to country
    else
      redirect_to country
    end
  end

  def update
    if not current_user.admin?
      redirect_to root_path and return
    end

    @suggestion = ProviderSuggestion.find(params[:id])
    @suggestion.update_attributes(params[:suggestion])
    respond_with @suggestion
  end
end
