class Api::V1::UserThirdSpacesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    render json: UserSerializer.new(user, include: ["third_spaces"])
  end

  def create
    params_user_id = params[:user_id]
    params_third_space_id = params[:third_space_id]
    user = User.find(params[:user_id]) 

    if UserThirdSpace.where("user_id = #{params_user_id} and third_space_id = #{params_third_space_id}") != []
      user_third_space_exists(params_user_id, params_third_space_id)
    elsif User.where("id = #{params_user_id}") == []
      no_user_response
    else
      user_third_space = UserThirdSpace.new(user_id: params_user_id, third_space_id: params_third_space_id)
      if user_third_space.save
        render json: UserSerializer.new(user, include: ["third_spaces"])
      else
        no_user_third_space_response(params_user_id, params_third_space_id)
      end
    end
  end

  def destroy
    space = ThirdSpace.find(params[:third_space_id])
    user = User.find(params[:user_id])
    user_third_space = UserThirdSpace.where(user_id: user.id).where(third_space_id: space.id).first

    if user_third_space != nil
      render json: UserThirdSpace.delete(user_third_space.id), status: 204
    else
      no_user_third_space_response(user.id, space.id)
    end
  end

  private
  def user_params
    params.permit(:user_id, :third_space_id)
  end

  def no_user_third_space_response(user_id, third_space_id)
    render json: ErrorSerializer.new(
      ErrorMessage.new(
        "No user_third_space with user_id=#{user_id} AND third_space_id=#{third_space_id} exists", 404
      )).serialize_json, status: 404
  end

  def user_third_space_exists(user_id, third_space_id)
    render json: ErrorSerializer.new(
      ErrorMessage.new(
        "Validation failed: user third_space association between user with user_id=#{user_id} and third_space_id=#{third_space_id} already exists", 422
      )).serialize_json, status: 422
  end
end