Rails.application.routes.draw do
  resources :messages, only: [:create]
  resources :channels, only: [:index, :show]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
