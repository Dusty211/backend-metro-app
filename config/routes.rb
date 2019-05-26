Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :platforms, only: [:index]
      get 'itineraries/find', to: 'itineraries#find'
      get 'arrivals/find', to: 'arrivals#find'
    end
  end
end
