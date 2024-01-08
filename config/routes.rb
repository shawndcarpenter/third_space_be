Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # namespace :api do
  #   namespace :v0 do
  #     resources :spaces, only: [] do
  #       collection do
  #         get :search_spaces
  #         get :create_third_space
  #       end    
  #     end
  #   end
  # end

  namespace :api do
    namespace :v1 do
      resources :user_third_spaces, only: [:create]
      
      delete "/user_third_spaces", to: "user_third_spaces#destroy"

      resources :users do
        resources :third_spaces, only: [:index], :controller=>:user_third_spaces
      end

      resources :third_spaces do
        collection do
          get :create_third_space
        end 
      end

      resources :locations, only: [] do
        collection do
          get :search_locations
        end 
      end
    end
  end

end
