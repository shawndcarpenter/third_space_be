class Api::V0::SpacesController < ApplicationController

  def create_third_spaces
    name = "Five Watt"
    address = "Minneapolis"

    conn = Faraday.new(url: "https://api.yelp.com/v3/businesses") do |faraday|
      faraday.params["key"] = Rails.application.credentials.yelp[:key]
    end

    response = conn.get("/search?latitude=44.932850&longitude=-93.267130")
    data = JSON.parse(response.body, symbolize_names: true)

    require 'pry'; binding.pry
  end


end