class LocationSearchFacade
  def initialize(name, city)
    @name = name
    @city = city
  end

  def locations
    service = LocationSearchService.new
    json = service.find_locations(@name, @city)
    # binding.pry
    @locations = json.map do |location|
      SearchResult.new(location)
    end
  end
end