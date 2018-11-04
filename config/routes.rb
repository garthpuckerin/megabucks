Rails.application.routes.draw do
  # get 'main/index'
  # get 'main/show'
  # get 'main/new'
  # get 'main/create'
  # get 'main/update'
  # get 'main/edit'
  # get 'main/destroy'
  resources :main
  # get 'matches/index'
  # get 'matches/show'
  # get 'matches/new'
  # get 'matches/create'
  # get 'matches/update'
  # get 'matches/edit'
  # get 'matches/destroy'
  resources :matches do
    collection { post :import }
  end 
  # get 'locations/index'
  # get 'locations/show'
  # get 'locations/new'
  # get 'locations/create'
  # get 'locations/update'
  # get 'locations/edit'
  # get 'locations/destroy'
  resources :locations
  # get 'profiles/index'
  # get 'profiles/show'
  # get 'profiles/new'
  # get 'profiles/create'
  # get 'profiles/update'
  # get 'profiles/edit'
  # get 'profiles/destroy'
  resources :profiles

  root 'main#index'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
