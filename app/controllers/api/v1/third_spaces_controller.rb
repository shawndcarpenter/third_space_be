class Api::V1::ThirdSpacesController < ApplicationController
  
  def index
    spaces = ThirdSpace.includes(:markers).all
    render json: ThirdSpaceSerializer.new(spaces)
  end

  def show
    # if ThirdSpace.all == []
    #   create_third_space
    # else
    render json: 
    ThirdSpaceSerializer.new(ThirdSpace.find(params[:id]), include: ['markers'])

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
  
    render json: ThirdSpaceSerializer.new(third_space), status: 201
  end

  def update
    third_space = ThirdSpace.find(params[:id])
    if third_space.markers == []
      third_space.markers.create!
    end

    update_all(third_space.markers.first, params)
    render json: ThirdSpaceSerializer.new(third_space)
  end

  def destroy
    third_space = ThirdSpace.find(params[:id])
    if third_space
      third_space.destroy
      render json: { message: 'Record successfully destroyed' }
    else
      render json: { error: 'Record not found' }, status: :not_found
    end
  end

  def search
    find_matching_third_spaces(params)
  end

  private
  def find_matching_third_spaces(params)
    search_results = []
    Marker.all.each do |marker|
      if (marker.tags.include?(params[:tags]) || !params[:tags]) &&
          (marker.volume.include?(params[:volume]) || !params[:volume]) &&
          (marker.gender_neutral_restrooms.include?(params[:gender_neutral_restrooms]) || !params[:gender_neutral_restrooms]) &&
          (marker.accessible_entrance.include?(params[:accessible_entrance]) || !params[:accessible_entrance]) &&
          (marker.customer_restrooms.include?(params[:customer_restrooms]) || !params[:customer_restrooms]) &&
          (marker.parking.include?(params[:parking]) || !params[:parking]) &&
          (marker.purchase_necessary.include?(params[:purchase_necessary]) || !params[:purchase_necessary]) &&
          (marker.sober.include?(params[:sober]) || !params[:sober]) &&
          (marker.child_friendly.include?(params[:child_friendly]) || !params[:child_friendly]) &&
          (marker.light_level.include?(params[:light_level]) || !params[:light_level]) &&
          (marker.public_transportation_nearby.include?(params[:public_transportation_nearby]) || !params[:public_transportation_nearby]) &&
          (marker.bipoc_friendly.include?(params[:bipoc_friendly]) || !params[:bipoc_friendly]) &&
          (marker.queer_friendly.include?(params[:queer_friendly]) || !params[:queer_friendly]) &&
          (marker.staff_responsiveness.include?(params[:staff_responsiveness]) || !params[:staff_responsiveness])
          search_results << marker 
      end 
    end
    #   elsif params.include?(volume)

    # end
    # params.each do |key, value|
    #   case key
    #   when "tags"
    #     # search_results = Marker.where(tags: ["#{value}"])
    #     # search_results = Marker.where('tags.first ILIKE ?' "%#{value}")
    #   else
    #     search_results.each do |marker|
    #       if !marker.(key).include?(value)
    #         search_results.delete(marker)
    #       end
    #     end
    #   end

      #   # search_results = search_results.where(volume: ["#{value}"])
      # elsif key == "accessible_entrance"
      #   # search_results = search_results.where(accessible_entrance: ["#{value}"])
      # elsif key == "customer_restrooms"
      #   # search_results = search_results.where(customer_restrooms: ["#{value}"])
      # elsif key == "parking"
      #   # search_results = search_results.where(parking: ["#{value}"])
      # elsif key == "purchase_necessary"
      #   # search_results = search_results.where(purchase_necessary: ["#{value}"])
      # elsif key == "sober"
      #   # search_results = search_results.where(sober: ["#{value}"])
      # elsif key == "child_friendly"
      #   # search_results = search_results.where(child_friendly: ["#{value}"])
      # elsif key == "light_level"
      #   # search_results = search_results.where(light_level: ["#{value}"])
      # elsif key == "public_transportation_nearby"
      #   # search_results = search_results.where(public_transportation_nearby: ["#{value}"])
      # elsif key == "bipoc_friendly"
      #   # search_results = search_results.where(bipoc_friendly: ["#{value}"])
      # elsif key == "queer_friendly"
      #   # search_results = search_results.where(queer_friendly: ["#{value}"])
      # elsif key == "staff_responsiveness"
      #   # search_results = search_results.where(staff_responsiveness: ["#{value}"])
      # end
    # end
    third_spaces = search_results.pluck(:third_space_id).map do |result|
      ThirdSpace.find(result)
    end

    render json: ThirdSpaceSerializer.new(third_spaces), status: 200
  end

  def update_all(marker, params)
    marker.update!(tags: ([marker[:tags]] + params[:tags]).flatten.reject(&:blank?))
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