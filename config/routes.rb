Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  get "/user", to: "users#homepage"
  resources :pedalos, only: [:index, :show, :new, :create] do
    member do
      get 'reservations', to: 'reservations#index_res_pedalos'
    end
    resources :reservations, only: [:show, :new, :create, :update]
  end
  get 'reservations', to: 'reservations#index_res_users'

  get "/reservations/:reservation_id/reviews/new", to: "reviews#new"
  post "/pedalos/:pedalo_id", to: "reviews#create"
end
