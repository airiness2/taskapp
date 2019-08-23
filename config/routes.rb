Rails.application.routes.draw do
  resources :label, only:[:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks do
    member do
      delete :delete_file_attachment
    end
  end
  resources :users, only:[:new, :create, :show]
  resources :sessions, only:[:new, :create, :destroy ]
  resources :groups

  namespace :admin do
    resources :users
  end

  resources :groupings, only: [:create, :destroy]
end
