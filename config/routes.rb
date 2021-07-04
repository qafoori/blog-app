Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'faq', to: 'pages#faq'
  # resources :articles, only: %i[show index new create edit update destroy]
  resources :articles
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: %i[new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: %i[destroy]
end
