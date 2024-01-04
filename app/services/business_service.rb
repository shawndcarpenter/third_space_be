class BusinessService
  def find_business(business)
    conn = Faraday.new("https://api.tomtom.com/search/2/nearbySearch/.json") do |faraday|
      faraday.params["key"] = ENV["TOM_TOM_API_KEY"]
      faraday.params["lat"] = business.lat
      faraday.params["lon"] = business.lon
    end

    response = conn.get("")
    JSON.parse(response.body, symbolize_names: :true)
  end
end
