require 'rails_helper'

def create_user(created_at)
  create(:user_random, created_at: created_at)
end

RSpec.describe "Reports", type: :request do
  describe "GET /report/nru" do
    it 'response with application json' do
      get '/report/nru?start=2019-09-07T-15:50+00&end=2019-09-07T-15:50+00'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'response with data of user' do
      create_user('2019-09-07T-13:50+07')
      create_user('2019-09-07T-12:50+07')
      create_user('2019-09-08T-11:50+07')
      create_user('2019-09-08T-18:50+07')
      create_user('2019-09-08T-22:50+07')
      create_user('2019-09-09T-20:50+07')
      create_user('2019-09-09T-19:50+07')
      create_user('2019-09-10T-16:50+07')
      create_user('2019-09-11T-13:50+07')
      get '/report/nru?start=2019-09-07T-15:50+07&end=2019-09-12T-15:50+07'
      expected = {total: 9,
                  histogram: [{
                                date: '2019-09-07',
                                count: 2
                              },
                              {
                                date: '2019-09-08',
                                count: 3
                              },
                              {
                                date: '2019-09-09',
                                count: 2
                              },
                              {
                                date: '2019-09-10',
                                count: 2
                              },
                              {
                                date: '2019-09-11',
                                count: 2
                              }]}
      expect(response.content_type).to eq('application/json; charset=utf-8')
      byebug
      expect(response.body).to eq(expected)
    end

    it 'response bad request when no start' do
      get '/report/nru?end=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end

    it 'response bad request when no end' do
      get '/report/nru?start=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end

    it 'response bad request when no end' do
      get '/report/nru?start=2021-05-24'
      puts response
      expect(response).to have_http_status(:bad_request)
    end


  end
end
