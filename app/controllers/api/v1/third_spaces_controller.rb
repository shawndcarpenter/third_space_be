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
    third_space = ThirdSpace.create(space_params)
    
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
                :open_now             
                )
  end
end