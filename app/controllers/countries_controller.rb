class CountriesController < ApplicationController
  def show
  	@country   = Country.find(params[:id])
  	@providers = @country.providers.best.paginate(:page => params[:page]).all
  end
end
