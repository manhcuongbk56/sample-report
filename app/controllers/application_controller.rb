class ApplicationController < ActionController::API

  def process_request(data = nil )
    yield
  rescue InvalidDataException => invalidData
    render json: {data: invalidData.field,message: InvalidDataException::INVALID_PARAM,  error_code: 0}, status: :bad_request
  end

end
