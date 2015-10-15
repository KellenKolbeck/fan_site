Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :comments
  end
  resources :searches
  devise_for :users
end
