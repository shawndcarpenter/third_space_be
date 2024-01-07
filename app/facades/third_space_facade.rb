class ThirdSpaceFacade
  def initialize(id)
    @id = id
  end
  
  def space
    service = ThirdSpaceService.new
    json = service.get_space_details(@id)
    ThirdSpacePoro.new(json)
  end
end