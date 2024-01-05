class SpaceSearchFacade
  def get_search_results(name, city)
    @service = SpaceSearchService.new
    @result_data = parse_json(@service.get_search_results(name, city))
  end

  def parse_json(data)
    data = JSON.parse(data.body, symbolize_names: true)[:businesses]
    search_results = data.map do |space_details|
      SearchResult.new(space_details)
    end
  end
end