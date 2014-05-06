Contacts::Application.routes.draw do
  resources :users, except: [:new, :edit] do
    resources :contacts, only: [:index]
  end

  resources :contacts, only: [:create, :destroy, :update, :show]
  resources :contact_shares, only: [:create, :destroy]

end
