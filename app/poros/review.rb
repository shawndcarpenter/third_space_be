class Review
  attr_reader :id, :name, :text, :rating, :yelp_id

  def initialize(data, yelp_id)
    @yelp_id = yelp_id
    @id = data[:id]
    @name = data[:user][:name]
    @text = data[:text]
    @rating = data[:rating]
  end

  def make_review_object
    ReviewObject.create!({
        yelp_id: @yelp_id, 
        name: @name, 
        text: @text, 
        rating: @rating, 
        id: @id 
        })
  end

end
 