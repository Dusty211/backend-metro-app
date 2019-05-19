Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :itineraries, only: [:show]
      # resources :platforms, only: [:source, :destination]
      get 'platforms/source', to: 'platforms#source'
      get 'platforms/destination', to: 'platforms#destination'
      get 'itineraries/find', to: 'itineraries#find'
    end
  end
end
