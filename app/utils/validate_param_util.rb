class ValidateParamUtil
  class << self
    def require_not_nil(param, param_name)
      raise InvalidDataException.new param_name unless param[param_name]
    end
  end
end