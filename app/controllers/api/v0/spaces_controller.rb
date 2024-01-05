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
    binding.pry

    third_space = data.map do |details|
      ThirdSpace.new(details)
    end

  end

  private
  # def params
  #   params.permit(:id)
  # end

  def search_params
    params.permit(:name, :city)
  end


end