Rails.application.routes.draw do
  get 'home/index'
  # Page d'accueil
  root 'home#index'

  # Routes pour les utilisateurs
  resources :users, only: [:show, :create, :update, :destroy] do
    # Routes imbriquées pour les consommations d'eau
    resources :consumptions, only: [:index, :create]

    # Routes imbriquées pour les alertes
    resources :alerts, only: [:index, :create]
  end

  # Routes pour les consommations d'eau accessibles directement
  resources :consumptions, only: [:show, :update, :destroy]

  # Routes pour les alertes accessibles directement
  resources :alerts, only: [:show, :update, :destroy]

  # Routes pour la gestion de session
  resource :session, only: [:new, :create, :destroy]

  # Route pour Action Cable (WebSockets)
  mount ActionCable.server => '/cable'
end
