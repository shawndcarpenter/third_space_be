class Api::V0::SpacesController < ApplicationController

  def search_locations
    name = search_params[:name]
    city = search_params[:city]

    locations = LocationSearchFacade.new(name, city).locations

    render json: SearchResultSerializer.new(locations)
  end

  def create_third_space
    id = params[:id]
    # if third spaces hash does not include yelp_id, create a third space
    # else, update hash
    facade = ThirdSpaceFacade.new(id).space

    render json: ThirdSpaceSerializer.new(facade).serializable_hash
  end

  private
  def search_params
    params.permit(:name, :city)
  end
end