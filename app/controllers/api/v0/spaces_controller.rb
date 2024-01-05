class Api::V0::SpacesController < ApplicationController

  def search_spaces
    name = "Five Watt"
    city = "Minneapolis"

    conn = Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.yelp[:key]
    end

    response = conn.get("?location=#{city}&term=#{name}")
    data = JSON.parse(response.body, symbolize_names: true)[:businesses]

    require 'pry'; binding.pry
  end


end