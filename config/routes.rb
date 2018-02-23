Rails.application.routes.draw do
  get 'downgrade/new'

  resources :wikis

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:new, :create]
  resources :collaborators, only: [:destroy]
  post 'downgrade/create'

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
