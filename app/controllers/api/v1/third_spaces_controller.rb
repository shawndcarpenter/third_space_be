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
    # yelp_id = params[:id]
    # third_spaces = ThirdSpace.all
    # if !third_spaces.empty?
    #   third_space = third_spaces.where("yelp_id = #{yelp_id}")
    #   if third_space == []
    #     space = ThirdSpaceFacade.new(yelp_id).space
    #     binding.pry
    #     ThirdSpace.new(space)
    #     # render json: ThirdSpaceSerializer.new(facade).serializable_hash
    #   else
    #     third_space.first
    #   end
    # else
    #   space = ThirdSpaceFacade.new(yelp_id).space
    #   render json: ThirdSpaceSerializer.new(space).serializable_hash
    # end
    space = ThirdSpace.create(space_params)
    space.update!(tags: params[:tags])
  
    render json: ThirdSpaceSerializer.new(space), status: 201
  end

  def update
    third_space = ThirdSpace.find(params[:id])

    update_all(third_space, params)
    
    render json: ThirdSpaceSerializer.new(third_space)
  end

  def destroy
    third_space = ThirdSpace.find(params[:id])
    if third_space
      render json: ThirdSpace.delete(params[:id])
    end
  end

  private
  def update_all(third_space, params)
    third_space.update!(tags: ([third_space[:tags]] + params[:tags]).flatten.reject(&:blank?))
    third_space.update!(gender_neutral_restrooms: ([third_space[:gender_neutral_restrooms]] + [params[:gender_neutral_restrooms]]).flatten.reject(&:blank?))
    third_space.update!(volume: ([third_space[:volume]] + [params[:volume]]).flatten.reject(&:blank?))
    third_space.update!(accessible_entrance: ([third_space[:accessible_entrance]] + [params[:accessible_entrance]]).flatten.reject(&:blank?))
    third_space.update!(customer_restrooms: ([third_space[:customer_restrooms]] + [params[:customer_restrooms]]).flatten.reject(&:blank?))
    third_space.update!(parking: ([third_space[:parking]] + [params[:parking]]).flatten.reject(&:blank?))
    third_space.update!(purchase_necessary: ([third_space[:purchase_necessary]] + [params[:purchase_necessary]]).flatten.reject(&:blank?))
    third_space.update!(sober: ([third_space[:sober]] + [params[:sober]]).flatten.reject(&:blank?))
    third_space.update!(child_friendly: ([third_space[:child_friendly]] + [params[:child_friendly]]).flatten.reject(&:blank?))
    third_space.update!(light_level: ([third_space[:light_level]] + [params[:light_level]]).flatten.reject(&:blank?))
    third_space.update!(public_transportation_nearby: ([third_space[:public_transportation_nearby]] + [params[:public_transportation_nearby]]).flatten.reject(&:blank?))
    third_space.update!(bipoc_friendly: ([third_space[:bipoc_friendly]] + [params[:bipoc_friendly]]).flatten.reject(&:blank?))
    third_space.update!(queer_friendly: ([third_space[:queer_friendly]] + [params[:queer_friendly]]).flatten.reject(&:blank?))
    third_space.update!(staff_responsiveness: ([third_space[:staff_responsiveness]] + [params[:staff_responsiveness]]).flatten.reject(&:blank?))
  end

  def search_params
    params.permit(:name, :city)
  end

  def space_params
    params.permit(
                :id, 
                :yelp_id, 
                :name, 
                :address, 
                :rating, 
                :phone, 
                :photos, 
                :lat, 
                :lon, 
                :price, 
                :hours, 
                :category, 
                :tags, 
                :open_now,               
                :gender_neutral_restrooms, 
                :volume, 
                :accessible_entrance, 
                :customer_restrooms, 
                :parking, 
                :purchase_necessary, 
                :sober, 
                :child_friendly, 
                :light_level, 
                :public_transportation_nearby, 
                :bipoc_friendly, 
                :queer_friendly, 
                :staff_responsiveness
                )
  end
end