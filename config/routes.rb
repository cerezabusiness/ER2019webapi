Rails.application.routes.draw do
  resources :faqs
  resources :places

  
  resources :multimedia_types
  resources :people
  resources :profiles
  resources :events
  resources :events do
    resources :places
    resources :activities
    resources :event_dates
    resources :people
    resources :information
    resources :multimedia
  end
  resources :companies
  namespace :api do
    namespace :v1 do
      resources :faqs
      resources :places

      
      resources :multimedia_types
      # resources :people
      resources :profiles
      resources :events
      resources :companies
      resources :events do
        resources :places
        resources :event_dates
        resources :activities
        resources :people
        resources :information
        resources :multimedia
      end
      post '/friendships', to: 'people#addFriend', as: 'new_friendship'
      get '/friendships/:id', to: 'people#getFriends'
    end
  end
  root to: "events#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
