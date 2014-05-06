FriendCircle::Application.routes.draw do
  resource :session
  resources :users do
    resources :circles, only: [:create, :new, :index]
    resources :posts do
      resources :links
    end
  end
  resources :circles, except: [:create, :new, :index]



end
