Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :spaceships, only: [:index, :show, :new, :create] do
    resources :journeys, only: [:create]
  end

  namespace :admin do
    resources :journeys, only: [:index]
    resources :spaceships, only: [:index, :edit, :update, :destroy]
  end
end
