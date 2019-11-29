Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'home#top'

  get 'about', to: 'home#about'
  get 'posts/api', to: 'posts#api'
  get 'posts/hesitation', to: 'posts#hesitation'
  post 'posts', to: 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
