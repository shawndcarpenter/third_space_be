class ReviewFacade
  def initialize(yelp_id)
    @yelp_id = yelp_id
  end
 
 
  def reviews
    service = ReviewService.new
    json = service.find_reviews(@yelp_id)
    unless json[:error]
      @reviews = json[:reviews].map do |review|
        # binding.pry
        Review.new(review)
      end
    end
  end
 end
 