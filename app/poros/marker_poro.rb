class MarkerPoro
  attr_reader :id,
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
              :staff_responsiveness,
              :tags

  def initialize
    @gender_neutral_restrooms = []
    @volume = []
    @accessible_entrance = []
    @customer_restrooms = []
    @parking = []
    @purchase_necessary = []
    @sober = []
    @child_friendly = []
    @light_level = []
    @public_transportation_nearby = []
    @bipoc_friendly = []
    @queer_friendly = []
    @staff_responsiveness = []
    @tags = []
  end
end