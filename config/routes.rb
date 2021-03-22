Rails.application.routes.draw do
  root to: 'pages#home'
  resources :pedalos, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:index_res_pedalos, :show, :new, :create]
  end
end
