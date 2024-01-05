class Api::V0::SpacesController < ApplicationController

  def create_spaces
    name = "Five Watt"
    city = "Minneapolis"

    conn = Faraday.new(url: "https://api.yelp.com/v3/businesses") do |faraday|
      faraday.params["key"] = Rails.application.credentials.yelp[:key]
    end

    response = conn.get("/search?location=#{city}&term=#{name}")
    data = JSON.parse(response.body, symbolize_names: true)

    require 'pry'; binding.pry
  end


end