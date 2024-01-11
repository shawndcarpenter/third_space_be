class Api::V1::UserThirdSpacesController < ApplicationController
  def index
    begin
    user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound => exception
    end
    if user
      render json: UserSerializer.new(user, include: ["third_spaces"])
    else
      user = User.new(id: params[:user_id])
      user.save!

      render json: UserSerializer.new(user, include: ["third_spaces"])
    end
  end

  def create
    params_user_id = params[:user_id]
    third_space = ThirdSpace.where(yelp_id: params[:third_space_id]).first
    params_third_space_id = third_space[:id]
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
    params_user_id = params[:user_id]
    third_space = ThirdSpace.where(yelp_id: params[:third_space_id]).first
    params_third_space_id = third_space[:id]
    user = User.find(params[:user_id]) 
    user_third_space = UserThirdSpace.where(user_id: params_user_id).where(third_space_id: params_third_space_id).first

    if user_third_space != nil
      render json: UserThirdSpace.delete(user_third_space.id), status: 204
    else
      no_user_third_space_response(params_user_id, params_third_space_id)
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