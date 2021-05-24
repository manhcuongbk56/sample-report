class MakeResponseUtil
  class << self
    def get_error_response(data: , error_code:, message: )
      {
        data: data,
        error_code: error_code,
        message: message
      }
    end

    def get_response(data:)
      {
        data: data,
      }
    end
  end
end