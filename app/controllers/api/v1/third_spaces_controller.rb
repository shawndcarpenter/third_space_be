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
    ThirdSpaceSerializer.new(ThirdSpace.find(params[:id]), include: ['markers'])
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
    third_space = ThirdSpace.create(space_params)
    third_space.markers.create!
    update_all(third_space.markers.first, params)
    third_space.update!(tags: ([third_space[:tags]] + params[:tags]).flatten.reject(&:blank?))
  
    render json: ThirdSpaceSerializer.new(third_space), status: 201
  end

  def update
    third_space = ThirdSpace.find(params[:id])
    if third_space.markers == []
      third_space.markers.create!
    end
    # third_space.markers.first
    # binding.pry
    third_space.update!(tags: ([third_space[:tags]] + params[:tags]).flatten.reject(&:blank?))
    update_all(third_space.markers.first, params)
    render json: ThirdSpaceSerializer.new(third_space)
  end

  def destroy
    third_space = ThirdSpace.find(params[:id])
    if third_space
      render json: ThirdSpace.delete(params[:id])
    end
  end

  private
  def update_all(marker, params)
    marker.update!(gender_neutral_restrooms: ([marker[:gender_neutral_restrooms]] + [params[:gender_neutral_restrooms]]).flatten.reject(&:blank?))
    marker.update!(volume: ([marker[:volume]] + [params[:volume]]).flatten.reject(&:blank?))
    marker.update!(accessible_entrance: ([marker[:accessible_entrance]] + [params[:accessible_entrance]]).flatten.reject(&:blank?))
    marker.update!(customer_restrooms: ([marker[:customer_restrooms]] + [params[:customer_restrooms]]).flatten.reject(&:blank?))
    marker.update!(parking: ([marker[:parking]] + [params[:parking]]).flatten.reject(&:blank?))
    marker.update!(purchase_necessary: ([marker[:purchase_necessary]] + [params[:purchase_necessary]]).flatten.reject(&:blank?))
    marker.update!(sober: ([marker[:sober]] + [params[:sober]]).flatten.reject(&:blank?))
    marker.update!(child_friendly: ([marker[:child_friendly]] + [params[:child_friendly]]).flatten.reject(&:blank?))
    marker.update!(light_level: ([marker[:light_level]] + [params[:light_level]]).flatten.reject(&:blank?))
    marker.update!(public_transportation_nearby: ([marker[:public_transportation_nearby]] + [params[:public_transportation_nearby]]).flatten.reject(&:blank?))
    marker.update!(bipoc_friendly: ([marker[:bipoc_friendly]] + [params[:bipoc_friendly]]).flatten.reject(&:blank?))
    marker.update!(queer_friendly: ([marker[:queer_friendly]] + [params[:queer_friendly]]).flatten.reject(&:blank?))
    marker.update!(staff_responsiveness: ([marker[:staff_responsiveness]] + [params[:staff_responsiveness]]).flatten.reject(&:blank?))
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