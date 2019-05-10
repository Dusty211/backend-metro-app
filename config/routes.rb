Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :itineraries, only: [:show]
      get 'itineraries/find', to: 'itineraries#find'
    end
  end
end
