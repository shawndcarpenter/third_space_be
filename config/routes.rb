Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v0 do
      resources :spaces, only: [] do
        collection do
          get :search_spaces
          get :create_third_space
        end    
      end
    end
  end
end
