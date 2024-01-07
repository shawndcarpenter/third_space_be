class Api::V1::UsersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    # binding.pry
    render json: UserSerializer.new(user, include: ["third_spaces"])
  end

  private
  def user_params
    params.permit(:user_id)
  end
end