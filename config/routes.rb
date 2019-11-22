Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root "boards#index"

  resources :boards do 
    resources :lists
  end

  resources :lists do
    resources :tasks
  end

end
