Rails.application.routes.draw do
  root 'events#index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, only: [:show]
  resources :events
end
