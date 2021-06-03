class SuccessResponse
  def initialize(data)
    @data = data
  end

  def to_response
    {data: @data.to_response}
  end

end