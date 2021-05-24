require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /report/nru" do
    it 'response with application json' do
      get '/report/nru?start=2020-02-05T00:00:00Z&end=2021-05-25T00:00:00Z'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'response bad request when no start' do
      get '/report/nru?end=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end
  end
end
