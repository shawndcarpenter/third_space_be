class Review
  attr_reader :id, :name, :text, :rating, :yelp_id

  def initialize(data, yelp_id)
    @yelp_id = yelp_id
    @id = data[:id]
    @name = data[:user][:name]
    @text = data[:text]
    @rating = data[:rating]
  end
 end
 