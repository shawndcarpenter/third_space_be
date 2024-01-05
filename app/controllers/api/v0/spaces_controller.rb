class Api::V0::SpacesController < ApplicationController

  def search_spaces
    name = search_params[:name]
    city = search_params[:city]

    conn = Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.yelp[:key]
    end

    response = conn.get("?location=#{city}&term=#{name}")
    data = JSON.parse(response.body, symbolize_names: true)[:businesses]

    search_results = data.map do |space|
      SearchResult.new(space)
    end

    render json: SearchResultSerializer.new(search_results).serializable_hash
  end

  def create_third_space
    id = params[:id]

    conn = Faraday.new(url: "https://api.yelp.com/v3/businesses/") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.yelp[:key]
    end

    response = conn.get("#{id}")
    data = JSON.parse(response.body, symbolize_names: true)

    third_space = ThirdSpace.create(
                                yelp_id: id,
                                name: data[:name],
                                address: data[:location][:display_address].join(", "), # Combine the address components
                                rating: data[:rating],
                                phone: data[:display_phone],
                                photos: data[:photos],
                                lat: data[:coordinates][:latitude],
                                lon: data[:coordinates][:longitude],
                                price: data[:price],
                                hours: data[:hours],
                                open_now: data[:hours].first[:is_open_now],  #Need to Clean this Up
                                category: data[:categories].first[:title],
                                tags: []
                                )

  end

  private

  def search_params
    params.permit(:name, :city)
  end


end