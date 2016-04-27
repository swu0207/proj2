Rails.application.routes.draw do
  devise_for :students
  devise_for :admins
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
end
