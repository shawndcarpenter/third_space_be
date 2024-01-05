class Api::V0::SpacesController < ApplicationController

  def search_spaces
    name = search_params[:name]
    city = search_params[:city]

    facade = SpaceSearchFacade.new
    search_results = facade.get_search_results(name, city)

    render json: SearchResultSerializer.new(search_results).serializable_hash
  end

  def create_third_space
    id = params[:id]

    facade = SpaceCreateFacade.new
    third_space = facade.get_space_details(id)

    render json: ThirdSpaceSerializer.new(third_space).serializable_hash
  end

  private

  def search_params
    params.permit(:name, :city)
  end


end