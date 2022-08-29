Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :reservations do
    collection do
      get :reservation
    end
  end
end