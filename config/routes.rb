Rails.application.routes.draw do
  devise_for :users

  root to: "pages#splash"
  resources :users, only: [:show]
  resources :pages
  resources :categories, only: %i[index new show create edit update destroy]
  resources :expenses, only: %i[new create edit update destroy]
end
