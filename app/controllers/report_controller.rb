require 'time'
class ReportController < ApplicationController

  def rev
    render json: {'status' => 'ok'}
  end

  def nru
    process_request do
      ValidateParamUtil.require_not_nil(params, :start)
      ValidateParamUtil.require_not_nil(params, :end)
      start_time = params[:start].to_time
      end_time = params[:end].to_time
      UserReportService.get_new_register(start_time, end_time)
    end
  end

  def download_time
    process_request do
      ValidateParamUtil.require_not_nil(params, :start)
      ValidateParamUtil.require_not_nil(params, :end)
      start_time = params[:start].to_time
      end_time = params[:end].to_time
      UserReportService.get_new_register(start_time, end_time)
    end
  end

end
