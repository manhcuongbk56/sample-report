require 'rails_helper'
require 'models/os_name'

def create_device(os_name, application_key, created_at)
  create(:installed_device,os_name: os_name, application_key: application_key, created_at: created_at)
end

def create_android(application_key, created_at)
  create_device(OsName::ANDROID, application_key, created_at)
end

def create_ios(application_key, created_at)
  create_device(OsName::IOS, application_key, created_at)
end

game_1 = 'game1'
game_2 = 'game2'

RSpec.describe "Reports", type: :request do
  before(:all) do
    create(:application, key: game_1, name: game_1)
    create(:application, key: game_2, name: game_2)
  end
  describe "GET /report/nru" do
    it 'response with application json' do
      get '/stats/download-time?start=2019-09-07T-15:50+00&end=2019-09-07T-15:50+00'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
    it 'should get all device installed' do
      3.times {      create_android(game_1, '2019-09-07T-13:50+07') }
      3.times {      create_android(game_2, '2019-09-07T-13:50+07') }
      1.times {      create_ios(game_1, '2019-09-07T-13:50+07') }
      2.times {      create_ios(game_2, '2019-09-07T-13:50+07') }

      3.times {      create_android(game_1, '2019-09-08T-13:50+07') }
      3.times {      create_android(game_2, '2019-09-08T-13:50+07') }
      1.times {      create_ios(game_1, '2019-09-08T-13:50+07') }
      2.times {      create_ios(game_2, '2019-09-08T-13:50+07') }

      4.times {      create_android(game_1, '2019-09-10T-13:50+07') }
      4.times {      create_android(game_2, '2019-09-10T-13:50+07') }
      1.times {      create_ios(game_1, '2019-09-10T-13:50+07') }
      2.times {      create_ios(game_2, '2019-09-10T-13:50+07') }

      5.times {      create_android(game_1, '2019-09-13T-13:50+07') }
      5.times {      create_android(game_2, '2019-09-13T-13:50+07') }
      1.times {      create_ios(game_1, '2019-09-13T-13:50+07') }
      2.times {      create_ios(game_2, '2019-09-13T-13:50+07') }
      get '/stats/download-time?start=2019-09-07T-15:50+07&end=2019-09-15T-15:50+07&app', params: { format: :json }

    end
    it 'response bad request when no start' do
      get '/stats/download-time?end=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end

    it 'response bad request when no end' do
      get '/stats/download-time?start=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end

    it 'response bad request when no end' do
      get '/stats/download-time?start=2021-05-25T00:00:00Z'
      puts response
      expect(response).to have_http_status(:bad_request)
    end


  end
end
