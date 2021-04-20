class ReportController < ApplicationController

  def rev
    render json: {'status' => 'ok'}
  end

end
