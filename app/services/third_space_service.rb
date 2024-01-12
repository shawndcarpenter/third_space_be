class ThirdSpaceService
  def conn
    conn = Faraday.new(url: "https://api.yelp.com/v3/businesses/") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials[:yelp_key]
    end
  end

  def get_space_details(id)
    response = conn.get("#{id}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end