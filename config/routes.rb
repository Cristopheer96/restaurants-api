Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do # pra que en defecto devuelva json
    namespace :v1 do
      resources :restaurants, only: [ :index, :show, :update, :create, :destroy]
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
