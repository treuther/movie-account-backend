Rails.application.routes.draw do
  
  //namespacing to match folder structure of controllers/api/v1
  namespace :api do
    namespace :v1 do
      resources :movies
      resources :genres
    end
  end
  
end
