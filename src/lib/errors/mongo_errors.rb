# Class representing validation errors on mongo
class ValidationError < StandardError
  attr_accessor :body, :code, :msg
  def initialize(record = {}, code = 422)
    @msg = 'Record was not saved'
    @body = record
    @code = code
    super(@msg)
  end
end

# Class representing NotFound errors on mongo
class RecordNotFoundError < StandardError
  attr_accessor :body, :code, :msg
  def initialize(query = {}, code = 404)
    @msg = 'Record was not found'
    @body = query
    @code = code
    super(@msg)
  end
end
