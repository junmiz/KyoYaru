Rails.application.routes.draw do
  devise_for :users
  #get 'static_pages/home'

  resources :today_tasks, :only => [:index, :update]

  #get 'tasks/select', to: 'select_tasks#index'
  #post 'tasks/select', to: 'select_tasks#create'

  resources :tasks, :only => [:index, :create, :destroy]
  get 'select', to: 'tasks#select_index'
  patch 'tasks/select', to: 'tasks#select_update'

  resources :historys, :only => [:index]  

  root :to => 'static_pages#home'
end
