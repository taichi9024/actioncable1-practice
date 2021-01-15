Rails.application.routes.draw do
  get "/" => "sessions#new"
  get 'sessions/new'

  resources :users do
    resources :rooms , only:[:new,:show, :create, :destroy]
  end
  
  resources :sessions , only:[:new, :create, :destroy]
end
