Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  get 'todo', to: 'todo#index'
  root :to => 'static_pages#home'
end
