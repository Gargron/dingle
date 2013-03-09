class ProvidersController < ApplicationController
  def show
  	@provider = Provider.find(params[:id])
  	@rating   = Rating.new( :provider => @provider )
    @rating.build_review
  end

  def new
    @provider = Provider.new
  end

  def create
    # TODO
  end
end
