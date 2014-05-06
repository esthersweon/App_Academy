PostsApp::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :posts do
    resources :tags, only: [:create]
  end
  resources :tags, only: [:destroy]
end
