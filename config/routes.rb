Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/user", to: "users#homepage", as: :user
  get "/user/pedalos", to: "users#homepage_pedalo", as: :user_pedalos
  resources :pedalos, only: [:index, :show, :new, :create]
  
  get "/pedalos/:pedalo_id/reservations", to: "reservations#index_res_pedalos", as: :pedalo_reservations
  get "/user/reservations", to: "reservations#index_res_users", as: :user_reservations
  get "/reservations/:id", to: "reservations#show", as: :reservation
  get "/pedalos/:pedalo_id/reservations/new", to: "reservations#new", as: :new_reservation
  post "/reservations/:id", to: "reservations#create"
  patch "/reservations/:id", to: "reservations#update"

  #   member do
  #     get 'reservations', to: 'reservations#index_res_pedalos'
  #   end
  #   resources :reservations, only: [:show, :new, :create, :update]
  # end
  # get 'reservations', to: 'reservations#index_res_users'

  get "/reservations/:reservation_id/reviews/new", to: "reviews#new", as: :new_review
  post "/pedalos/:pedalo_id", to: "reviews#create"
end
