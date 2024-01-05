class Api::V0::SpacesController < ApplicationController

  def nearest_spaces
    lat = "35.077529"
    lon = "-106.600449"

    conn = Faraday.new(url: "https://api.tomtom.com/search/2/nearbySearch/.json") do |faraday|
      faraday.params["key"] = Rails.application.credentials.tom_tom[:key]
    end

    response = conn.get("?lat=#{lat}&lon=#{lon}")
    data = JSON.parse(response.body, symbolize_names: true)

    require 'pry'; binding.pry
  end


end