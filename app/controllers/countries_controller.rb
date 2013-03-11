class CountriesController < ApplicationController
  def show
  	@country   = Country.find(params[:id])
  	@providers = @country.providers.order("score DESC").paginate(:page => params[:page]).all
  end
end
