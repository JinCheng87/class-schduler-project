Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  root to:'home#index'

  post '/event_registrations', to: 'event_registrations#new', as: 'event_registration'

  get '/event_registrations/success', to: 'event_registrations#success'

  get '/studios/all', to: 'studios#all'

  resources :studios do
    resources :events
  end
end
