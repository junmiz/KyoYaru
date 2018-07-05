Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  resources :todos, :only => [:index, :create, :destroy]
  resources :today_todos, :only => [:index]
  root :to => 'static_pages#home'
end
