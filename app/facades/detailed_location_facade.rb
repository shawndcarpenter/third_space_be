class LocationSearchFacade
  def initialize(yelp_id)
    @yelp_id = yelp_id
  end

  def location
    service = DetailedLocationService.new
    json = service.find_location(@yelp_id)
    SearchResult.new(json)
  end
end