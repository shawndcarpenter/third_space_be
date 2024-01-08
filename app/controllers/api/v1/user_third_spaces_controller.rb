class Api::V1::UserThirdSpacesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    render json: UserSerializer.new(user, include: ["third_spaces"])
  end

  def create
    space = ThirdSpace.find(params[:third_space_id])
    user = User.find(params[:user_id])
    UserThirdSpace.create!(user_id: user.id, third_space_id: space.id)

    render json: UserSerializer.new(user, include: ["third_spaces"])
  end

  def destroy
    space = ThirdSpace.find(params[:third_space_id])
    user = User.find(params[:user_id])
    user_third_space = UserThirdSpace.where(user_id: user.id).where(third_space_id: space.id).first

    if user_third_space != nil
      render json: UserThirdSpace.delete(user_third_space.id), status: 204
    end
  end

  private
  def user_params
    params.permit(:user_id, :third_space_id)
  end
end