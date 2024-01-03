class Business
  attr_reader :name, :address, :lat, :lon

  def initialize(business)
    @name = business[:poi][:name]
    @address = "#{business[:address][:streetNumber]} #{business[:address][:streetName]}, #{business[:address][:municipality]}, #{business[:address][:countrySubdivision]} #{business[:address][:postalCode]}"
    @lat = business[:position][:lat]
    @lon = business[:position][:lon]
  end
end