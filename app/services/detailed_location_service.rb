class DetailedLocationService
  def conn
    Faraday.new(url: "https://api.yelp.com/v3/businesses/") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials[:yelp_key]
    end
  end

  def find_location(yelp_id)
    response = conn.get("#{yelp_id}")
    # binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end