Rails.application.routes.draw do
  root "reservations#index"
  resources :reservations, only: [:index, :new, :create]

  get "reservations/load_sizes", to: "reservations#load_sizes", as: :load_sizes
  get "reservations/availability", to: "reservations#availability", as: :availability
  post "reservations/check_availability", to: "reservations#check_availability", as: :check_availability
  
end
