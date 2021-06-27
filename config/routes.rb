Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'faq', to: 'pages#faq'
end
