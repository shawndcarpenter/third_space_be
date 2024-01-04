class BusinessFacade
  def initialize(business)
    @business = business
  end

  def businesses
    service = BusinessService.new

    json = service.find_business(@business)
    @businesses = json[:results].map do |business_data|
      Atm.new(business_data)
    end
  end
end