Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/user", to: "users#homepage"
  resources :pedalos, only: [:index, :show, :new, :create] do
    member do
      get 'reservations', to: 'reservations#index_res_pedalos'
    end
    resources :reservations, only: [:show, :new, :create]
  end
  get 'reservations', to: 'reservations#index_res_users'
end
