class ReviewFacade
  def initialize(yelp_id)
    @yelp_id = yelp_id
  end
 
 
  def reviews
    service = ReviewService.new
    json = service.find_reviews(@yelp_id)
    unless json[:error]
      @reviews = json[:reviews].map do |review|
        Review.new(review, @yelp_id)
      end
    end
  end
 end
 