Slingshot::Application.routes.draw do
  resources :tickets

  devise_for :users

  resources :charges, only: [:new, :create]

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
