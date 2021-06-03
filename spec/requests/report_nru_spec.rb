require 'rails_helper'

def create_user(created_at)
  create(:user, created_at: created_at)
end

RSpec.describe "Reports", type: :request do
  describe "GET /report/nru" do
    it 'response with application json' do
      get '/stats/nru?start=2019-09-07T-15:50+00&end=2019-09-07T-15:50+00'
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
      create_user('2019-09-15T-13:50+07')
      get '/stats/nru?start=2019-09-07T-15:50+07&end=2019-09-15T-15:50+07', params: { format: :json }
      expected = { data: { total: 10,
                           histogram: [{
                                         date: '2019-09-07T00:00Z',
                                         count: 2
                                       },
                                       {
                                         date: '2019-09-08T00:00Z',
                                         count: 3
                                       },
                                       {
                                         date: '2019-09-09T00:00Z',
                                         count: 2
                                       },
                                       {
                                         date: '2019-09-10T00:00Z',
                                         count: 1
                                       },
                                       {
                                         date: '2019-09-11T00:00Z',
                                         count: 1
                                       },
                                       {
                                         date: '2019-09-12T00:00Z',
                                         count: 0
                                       },
                                       {
                                         date: '2019-09-13T00:00Z',
                                         count: 0
                                       },
                                       {
                                         date: '2019-09-14T00:00Z',
                                         count: 0
                                       },
                                       {
                                         date: '2019-09-15T00:00Z',
                                         count: 1
                                       }] }

      }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to eq(expected.to_json)
    end

    it 'should get user at the end of day' do
      create_user('2019-09-07 23:59:59.999999999 +0700')
      create_user('2019-09-07 23:59:59.999999999 +0700')
      create_user('2019-09-08 23:59:59.999999999 +0700')
      create_user('2019-09-08 23:59:59.999999999 +0700')
      create_user('2019-09-08 23:59:59.999999999 +0700')
      create_user('2019-09-09 23:59:59.999999999 +0700')
      create_user('2019-09-09 23:59:59.999999999 +0700')
      create_user('2019-09-10 23:59:59.999999999 +0700')
      create_user('2019-09-11 23:59:59.999999999 +0700')
      create_user('2019-09-15 23:59:59.999999999 +0700')
      get '/stats/nru?start=2019-09-07T-15:50+07&end=2019-09-15T-15:50+07', params: { format: :json }
      expected = { data: { total: 10,
                           histogram: [{
                                         date: '2019-09-07T00:00Z',
                                         count: 2
                                       },
                                       {
                                         date: '2019-09-08T00:00Z',
                                         count: 3
                                       },
                                       {
                                         date: '2019-09-09T00:00Z',
                                         count: 2
                                       },
                                       {
                                         date: '2019-09-10T00:00Z',
                                         count: 1
                                       },
                                       {
                                         date: '2019-09-11T00:00Z',
                                         count: 1
                                       },
                                       {
                                         date: '2019-09-12T00:00Z',
                                         count: 0
                                       },
                                       {
                                         date: '2019-09-13T00:00Z',
                                         count: 0
                                       },
                                       {
                                         date: '2019-09-14T00:00Z',
                                         count: 0
                                       },
                                       {
                                         date: '2019-09-15T00:00Z',
                                         count: 1
                                       }] }

      }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to eq(expected.to_json)
    end

    it 'response bad rIOSequest when no start' do
      get '/stats/nru?end=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end

    it 'response bad request when no end' do
      get '/stats/nru?start=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end

    it 'response bad request when no end' do
      get '/stats/nru?start=2021-05-24'
      puts response
      expect(response).to have_http_status(:bad_request)
    end

  end
end
