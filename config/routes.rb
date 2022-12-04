Rails.application.routes.draw do
  resources :plays
  resources :games
  resources :players
  resources :winning_numbers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
