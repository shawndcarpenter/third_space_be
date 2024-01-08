class ApplicationController < ActionController::API
  class InvalidSearch < StandardError
  end

  rescue_from InvalidSearch, :with => :invalid_search_response

  def invalid_search_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new("Invalid set of parameters. Please provide a valid set of parameters to perform a search with this endpoint.", status: 422)).serialize_json, status: 422
  end
end
