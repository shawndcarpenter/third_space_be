class SpaceCreateFacade
  def get_space_details(id)
    @service = SpaceCreateService.new
    @result_data = parse_json(@service.get_space_details(id))
  end

  def parse_json(data)
    data = JSON.parse(data.body, symbolize_names: true)
    third_space = ThirdSpace.new(
      
                                yelp_id: data[:id],
                                name: data[:name],
                                address: data[:location][:display_address].join(", "), 
                                rating: data[:rating],
                                phone: data[:display_phone],
                                photos: data[:photos],
                                lat: data[:coordinates][:latitude],
                                lon: data[:coordinates][:longitude],
                                price: data[:price],
                                hours: data[:hours],
                                open_now: data[:hours].first[:is_open_now],  #Need to Clean this Up
                                category: data[:categories].first[:title],
                                tags: []
                                )
  end
end