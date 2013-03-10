class CountriesController < ApplicationController
  def show
  	@country   = Country.find(params[:id])
  	@providers = @country.providers.best.offset(params[:offset]).limit(21).all
  end
end
