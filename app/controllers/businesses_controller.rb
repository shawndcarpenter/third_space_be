class BusinessesController < ApplicationController

  def index
    conn = Faraday.new(url: "https://api.tomtom.com/search/2/nearbySearch/.json") do |faraday|
      faraday.params["key"] = Rails.application.credentials.tom_tom[:key]
    end

    binding.pry
  end


end