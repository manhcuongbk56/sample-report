Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :stats do
    get 'rev', to: 'report#rev'
    get 'nru', to: 'report#nru'
    get 'download-time', to: 'report#download_time'
  end
end
