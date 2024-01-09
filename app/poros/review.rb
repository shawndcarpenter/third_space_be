class Review
  attr_reader :id, :name, :text, :rating

  def initialize(data)
    @id = data[:id]
    @name = data[:user][:name]
    @text = data[:text]
    @rating = data[:rating]
  end
 end
 