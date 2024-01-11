class Api::V1::ThirdSpacesController < ApplicationController
  
  def index
    spaces = ThirdSpace.all
    render json: ThirdSpaceSerializer.new(spaces)
  end

  def show
    render json: 
    ThirdSpaceSerializer.new(ThirdSpace.find(params[:id]))
  end
  
  def create
    parsed_tags = JSON.parse(space_params[:tags])
    parsed_photos = JSON.parse(space_params[:photos])
    # parsed_hours = JSON.parse(space_params[:hours])

    third_space = ThirdSpace.create!(space_params)
    third_space.update!(tags: parsed_tags)
    third_space.update!(photos: parsed_photos)
    # third_space.update!(hours: parsed_hours)
    
    render json: ThirdSpaceSerializer.new(third_space), status: 201
  end

  def update
    third_space = ThirdSpace.find(params[:id])
    third_space.update!(tags: ([third_space[:tags]] + params[:tags]).flatten.reject(&:blank?))

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

  def search_by_name
    third_spaces = ThirdSpace.where("name ilike ?", "%#{params[:name]}%")
    render json: ThirdSpaceSerializer.new(third_spaces)
  end

  private
  def find_matching_third_spaces(params)
    search_results = []
    
    params[:tags].each_with_index do |tag, index|
      if index == 0
        ThirdSpace.all.each do |third_space|
          if third_space.tags.include?(tag)
            search_results << third_space 
          end 
        end
      else
        search_results.each do |third_space|
          if !third_space.tags.include?(tag)
            search_results.delete(third_space) 
          end 
        end
      end
    end

    render json: ThirdSpaceSerializer.new(search_results), status: 200
  end

  def search_params
    params.permit(:name, :city,                 
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
    :third_space)
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
                :third_space => {}
                )
  end
end