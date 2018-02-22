Rails.application.routes.draw do
  get 'downgrade/new'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:new, :create]
  post 'downgrade/create'
  resources :wikis do
    resources :collaborators, only: [:new, :create, :update, :destroy]
  end
  post 'delete_collaborators' => 'wikis#delete_collaborators', as: :deletecollaborators

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
