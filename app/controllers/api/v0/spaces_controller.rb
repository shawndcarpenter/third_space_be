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

    # conn = Faraday.new(url: "https://api.yelp.com/v3/businesses/") do |faraday|
    #   faraday.headers["Authorization"] = Rails.application.credentials.yelp[:key]
    # end

    # response = conn.get("#{id}")
    # data = JSON.parse(response.body, symbolize_names: true)

    # third_space = ThirdSpace.new(
    #                             yelp_id: id,
    #                             name: data[:name],
    #                             address: data[:location][:display_address].join(", "), 
    #                             rating: data[:rating],
    #                             phone: data[:display_phone],
    #                             photos: data[:photos],
    #                             lat: data[:coordinates][:latitude],
    #                             lon: data[:coordinates][:longitude],
    #                             price: data[:price],
    #                             hours: data[:hours],
    #                             open_now: data[:hours].first[:is_open_now],  #Need to Clean this Up
    #                             category: data[:categories].first[:title],
    #                             tags: []
    #                             )

    facade = SpaceCreateFacade.new
    third_space = facade.get_space_details(id)

    render json: ThirdSpaceSerializer.new(third_space).serializable_hash
  end

  private

  def search_params
    params.permit(:name, :city)
  end


end