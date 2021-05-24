class InvalidDataException < RuntimeError

  attr_reader :field

  INVALID_PARAM = 'invalid param'
  def initialize(field)
    super(INVALID_PARAM)
    @field = field
  end
end