class Api::V1::InfoController < ApplicationController
  def index
    render json: ErrorSerializer.new(
      ErrorMessage.new(
        "Welcome to the third_space_be api. You must be a third space team member to use this application", 422
      )).serialize_json, status: 422
  end
end