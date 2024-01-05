class SearchResult
  attr_reader :id, :name, :address, :category

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @address = data[:location][:address1] + ", " + data[:location][:city] + ", " + data[:location][:state] + ", " + data[:location][:zip_code]
    @category = data[:categories].first[:title]
  end
end