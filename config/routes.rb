Rails.application.routes.draw do
  resources :event_dates
  resources :activities
  resources :time_ranges
  resources :faqs
  resources :places
  resources :information
  resources :multimedia
  resources :multimedia_types
  resources :people
  resources :profiles
  resources :events
  resources :companies
  namespace :api do
    namespace :v1 do
      resources :event_dates
      resources :activities
      resources :time_ranges
      resources :faqs
      resources :places
      resources :information
      resources :multimedia
      resources :multimedia_types
      resources :people
      resources :profiles
      resources :events
      resources :companies
    end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
