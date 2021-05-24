Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :report do
    get 'rev', to: 'report#rev'
    get 'nru', to: 'report#nru'
  end
end
