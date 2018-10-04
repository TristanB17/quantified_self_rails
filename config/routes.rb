Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals do
        get '/foods', to: 'food_meals#index'
        post '/foods/:id', to: 'food_meals#create'
        delete '/foods/:id', to: 'food_meals#destroy'
      end
      get '/favorite_foods', to: 'favorite_foods#index'
    end
  end
end
