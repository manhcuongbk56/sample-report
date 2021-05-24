class ReportController < ApplicationController

  def rev
    render json: {'status' => 'ok'}
  end

  def nru
    process_request do
      ValidateParamUtil.require_not_nil(params, :start)
      render json: MakeResponseUtil.get_response(data: 'ok')
    end
  end

end
