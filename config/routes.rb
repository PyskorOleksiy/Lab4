Rails.application.routes.draw do  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "clubs#index"

  resources :tournaments do
    resources :homes, :aways 
  end
  
  get '/clubs/all_players', to: 'players#all_players'
  get '/clubs/coaches', to: 'coaches#index'
  resources :clubs do
    get '/show', to: 'coaches#show'
    resources :players, :coaches
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
