FinalApp::Application.routes.draw do
  root to: 'static_pages#root'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: { format: :json } do

    resources :projects, except: [:new, :edit]

    resources :phases do
      resources :tasks, only: [:create, :new, :show]
    end

  end

end
