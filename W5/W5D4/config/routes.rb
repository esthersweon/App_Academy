RedditClone::Application.routes.draw do
  get "comments/new"
  get "comments/edit"
  get "links/edit"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :subs

  resources :links do
    resources :comments, only: [:index, :new]
  end

  resources :comments, except: [:index, :new]

  root to: 'subs#index'
end
