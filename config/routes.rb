Rails.application.routes.draw do
  root 'pages#home'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_for :users, path: '/', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :documents, only: [:index, :new, :create, :destroy]

  namespace :admins do
    resources :dashboards, only: :index
    resources :categories
  end
end
