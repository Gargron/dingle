class ProvidersController < ApplicationController
  def show
  	@provider = Provider.find(params[:id])
  	@rating   = Rating.new( :provider => @provider )
    @rating.build_review
  end

  def new
    @provider = Provider.new(country: Country.find(params[:country_id]))
  end

  def create
    # TODO
  end
end
