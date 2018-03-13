class ValidationError < StandardError
  attr_accessor :body, :code, :msg
  def initialize(record = {}, code = 422)
    @msg = "Record was not saved"
    @body = record
    @code = code
    super(@msg)
  end

end