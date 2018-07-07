Rails.application.routes.draw do
  devise_for :users
  #get 'static_pages/home'

  resources :tasks, :only => [:index, :create, :destroy]
  
  get 'tasks/select', to: 'select_tasks#index'
  post 'tasks/select', to: 'select_tasks#create'

  resources :today_tasks, :only => [:index]
  
  get 'tasks/today', to: 'today_tasks#index'

  root :to => 'static_pages#home'
end
