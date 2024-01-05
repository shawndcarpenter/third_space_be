class SpaceSearchService

  def conn
    conn = Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.yelp[:key]
    end
  end

  def get_search_results(name, city)
    response = conn.get("?location=#{city}&term=#{name}")
  end

end