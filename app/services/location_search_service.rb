class LocationSearchService
  def conn
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = ENV['YELP_API_KEY'] # Rails.application.credentials.yelp[:key]
    end
  end

  def find_locations(name, city)
    response = conn.get("?location=#{city}&term=#{name}")
    JSON.parse(response.body, symbolize_names: true)[:businesses]
  end
end