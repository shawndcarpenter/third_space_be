class Api::V1::ThirdSpacesController < ApplicationController
  
  def index
    spaces = ThirdSpace.all
    render json: ThirdSpaceSerializer.new(spaces)
  end

  def show
    # if ThirdSpace.all == []
    #   create_third_space
    # else
    render json: 
    ThirdSpaceSerializer.new(ThirdSpace.find(params[:id]))
    # binding.pry
    #   if !third_space
    #     create_third_space
    #   end
    # end
  end
  
  def create
    # if third spaces hash does not include yelp_id, create a third space
    # else, update hash
    yelp_id = params[:id]
    third_spaces = ThirdSpace.all
    if !third_spaces.empty?
      third_space = third_spaces.where("yelp_id = #{yelp_id}")
      if third_space == []
        space = ThirdSpaceFacade.new(yelp_id).space
        binding.pry
        ThirdSpace.new(space)
        # render json: ThirdSpaceSerializer.new(facade).serializable_hash
      else
        third_space.first
      end
    else
      space = ThirdSpaceFacade.new(yelp_id).space
      render json: ThirdSpaceSerializer.new(space).serializable_hash
    end
  end

  def update
    third_space = ThirdSpace.find(params[:id])

    render json: ThirdSpaceSerializer.new(ThirdSpace.update(params[:id], space_params))
  end

  def destroy
    third_space = ThirdSpace.find(params[:id])
    if third_space
      render json: ThirdSpace.delete(params[:id])
    end
  end

  private
  def search_params
    params.permit(:name, :city)
  end

  def space_params
    params.permit(:id, :yelp_id, :name, :address, :rating, :phone, :photos, :lat, :lon, :price, :hours, :category, :tags, :open_now)
  end
end