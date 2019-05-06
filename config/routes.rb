Rails.application.routes.draw do
  resources :faqs
  resources :places
  resources :information
  resources :multimedia
  resources :multimedia_types
  resources :people
  resources :profiles
  resources :events
  resources :events do
    resources :places
    resources :activities
    resources :event_dates
    resources :people
  end
  resources :companies
  namespace :api do
    namespace :v1 do
      resources :faqs
      resources :places
      resources :information
      resources :multimedia
      resources :multimedia_types
      resources :people
      resources :profiles
      resources :events
      resources :companies
      resources :events do
        resources :places
        resources :event_dates
        resources :activities
        resources :people
      end
    end
  end
  root to: "events#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
