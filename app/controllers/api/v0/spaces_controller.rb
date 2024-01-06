class Api::V0::SpacesController < ApplicationController

  def search_spaces
    name = search_params[:name]
    city = search_params[:city]

    locations = LocationSearchFacade.new(name, city).locations

    render json: SearchResultSerializer.new(locations)
  end

  def create_third_space
    id = params[:id]

    facade = ThirdSpaceFacade.new
    third_space = facade.get_space_details(id)

    render json: ThirdSpaceSerializer.new(third_space).serializable_hash
  end

  private
  def search_params
    params.permit(:name, :city)
  end
end