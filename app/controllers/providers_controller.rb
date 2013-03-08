class ProvidersController < ApplicationController
  def show
  	@provider = Provider.find(params[:id])
  	@rating   = Rating.new( :provider => @provider )
    @rating.build_review
  end
end
