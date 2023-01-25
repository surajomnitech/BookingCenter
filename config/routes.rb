Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :booking_element_types , :only => [:index]
      resources :slots
      resources :bookings
      resources :booking_elements, :only => [:index, :show]
      resources :sites , :only => [:index, :show]
      resources :users
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"
    end
    namespace :admin do
      resources :booking_element_available_times
      resources :booking_element_types
      resources :booking_statuses
      resources :bookings
      resources :booking_elements, :only => [:index, :show, :create, :destroy]
      resources :sites
      resources :users
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"
    end
  end
end
