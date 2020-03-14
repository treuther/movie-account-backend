Rails.application.routes.draw do
  
  resources :notes
  #namespacing to match folder structure of controllers/api/v1
  #nesting movies with genres
  namespace :api do
    namespace :v1 do
      resources :movies
      resources :genres do
        resources :movies
      end
    end
  end
  
end
