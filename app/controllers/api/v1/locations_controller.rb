class Api::V1::LocationsController < ApplicationController
  def search_locations
    name = search_params[:name]
    city = search_params[:city]

    locations = LocationSearchFacade.new(name, city).locations

    render json: SearchResultSerializer.new(locations)
  end

  private
  def search_params
    params.permit(:name, :city)
  end
end