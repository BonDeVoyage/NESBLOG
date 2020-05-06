Rails.application.routes.draw do
  root 'pages#index'
  get 'articles/new'
  get 'pages/index'
  get 'about', to: 'pages#about'
  get 'singup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :articles
  resources :users, except: [:new]
  resources :comments
  resources :articles do
	resources :comments
  end
end
