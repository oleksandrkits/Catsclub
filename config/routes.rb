Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "search#index"
  resources :favourites, only: [:index, :new, :create, :destroy]
  resources :images, only: [:show]
end
