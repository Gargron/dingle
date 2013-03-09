class SuggestionsController < ApplicationController
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
end
