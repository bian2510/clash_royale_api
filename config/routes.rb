Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "tournaments#index"

  resources :tournaments
  get '/get_clan/:id', to: 'tournaments#get_clan_for_create_tournament'
end
