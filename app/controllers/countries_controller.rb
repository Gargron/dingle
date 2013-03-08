class CountriesController < ApplicationController
  def show
  	@country   = Country.find(params[:id])
  	@providers = @country.providers.order("score DESC").all
  end
end
