class DetailedLocationFacade
  def initialize(yelp_id)
    @yelp_id = yelp_id
  end

  def location
    service = DetailedLocationService.new
    json = service.find_location(@yelp_id)
    unless json[:error]
      DetailedLocation.new(json)
    end
  end
end