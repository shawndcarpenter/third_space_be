class Api::V1::LocationsController < ApplicationController
  def search_locations
    name = search_params[:name]
    city = search_params[:city]

    locations = LocationSearchFacade.new(name, city).locations

    render json: SearchResultSerializer.new(locations)
  end

  def show
    location = DetailedLocationFacade.new(params[:id]).location
    if location
      render json: DetailedLocationSerializer.new(location)
    else 
      no_location_response
    end
  end

  private
  def search_params
    params.permit(:name, :city, :id)
  end

  def no_location_response
    render json: ErrorSerializer.new(
    ErrorMessage.new(
      "The requested business could not be found.", 404
    )).serialize_json, status: 404
  end
end