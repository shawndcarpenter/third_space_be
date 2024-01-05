class SearchResult
  attr_reader :id, :name, :address, :category

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @address = data[:location][:display_address].join(", ")
    @category = data[:categories].first[:title]
  end
end