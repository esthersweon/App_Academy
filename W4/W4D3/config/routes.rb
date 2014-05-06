CatRentals::Application.routes.draw do
  resources :cats do
    resources :cat_rental_requests, only:[:index, :create, :new ]
  end

  resources :cat_rental_requests, except: [:index, :create, :new ]

end
