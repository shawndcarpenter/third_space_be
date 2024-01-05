class Api::V0::BusinessesController < ApplicationController

  def nearest_businesses
    conn = Faraday.new(url: "https://api.tomtom.com/search/2/nearbySearch/.json") do |faraday|
      faraday.params["key"] = Rails.application.credentials.tom_tom[:key]
    end

    response = conn.get("/api/v1/parks/?stateCode=#{state}")

    require 'pry'; binding.pry
  end


end