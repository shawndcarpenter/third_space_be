class Review
  attr_reader :id, :name, :text, :rating, :date, :yelp_id

  def initialize(data, yelp_id)
    @yelp_id = yelp_id
    @id = data[:id]
    @name = data[:user][:name]
    @text = data[:text]
    @rating = data[:rating]
    @date = data[:time_created].split(' ').first
  end

  def make_review_object
    ReviewObject.create!({
        yelp_id: @yelp_id, 
        name: @name, 
        text: @text, 
        rating: @rating, 
        date: @date,
        id: @id 
        })
  end

end
 