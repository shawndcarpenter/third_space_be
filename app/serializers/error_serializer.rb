class ErrorSerializer
  def initialize(error_object)
    @error_object = error_object
  end

  def serialize_json
    {
      errors: [
        {
          detail: @error_object.message
        }
      ]
    }
  end
end