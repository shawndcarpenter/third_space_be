class SpaceCreateFacade
  def get_space_details(id)
    @service = SpaceCreateService.new
    @result_data = parse_json(@service.get_space_details(id))
  end

  def parse_json(data)
    data = JSON.parse(data.body, symbolize_names: true)
    array = []
    array << ThirdSpace.new(data)
    array
  end
end