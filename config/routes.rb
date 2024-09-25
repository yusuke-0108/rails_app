Rails.application.routes.draw do
  get "/signup", to:"users#new"
  resources :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
