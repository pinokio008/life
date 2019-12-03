Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'home#top'

  get 'about', to: 'home#about'
  get 'posts/hesitation', to: 'posts#hesitation'
  get 'posts/:id/api', to: 'posts#api', as: 'api'
  get 'posts/:id', to: 'posts#show', as: 'post'
  post 'posts', to: 'posts#create'
  patch 'posts/:id', to: 'posts#update'
  put 'posts/:id', to: 'posts#update'
  get 'users/:id', to: 'users#show', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
