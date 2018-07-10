Rails.application.routes.draw do
  devise_for :users
  #get 'static_pages/home'

  resources :tasks, :only => [:index, :create, :destroy]
  
  get 'tasks/select', to: 'select_tasks#index'
  post 'tasks/select', to: 'select_tasks#create'

  #get 'today_tasks', to: 'today_tasks#index'
  #patch 'today_tasks/:id', to: 'today_tasks#update'
  resources :today_tasks, :only => [:index, :update]

  root :to => 'static_pages#home'
end
