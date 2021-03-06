Rails.application.routes.draw do
  resources :users
  resource :session
  resources :bands do
    resources :albums, only: :new
  end
  resources :albums, except: :new do
    resources :tracks, only: :new
  end
  resources :tracks, except: :new

  resources :notes, only: [:create, :destroy]
end
