FinalApp::Application.routes.draw do
  root to: 'static_pages#root'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: { format: :json } do

    resources :projects, except: [:new, :edit] do
      resources :phases, only: [:index, :show, :create, :update, :destroy]
    end

    resources :phases, only: [:show, :update, :destroy] do
      resources :tasks, only: [:create, :index]
    end

    resources :tasks, only: [:show, :update, :destroy]

  end

end
