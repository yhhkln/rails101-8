Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end


  resources :movies do
    put :favorite, on: :member
    resources :favorite do
    end
  end



  namespace :account do
    resources :groups
    resources :posts
  end
end
