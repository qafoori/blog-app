Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "faq", to: "pages#faq"
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles
end
