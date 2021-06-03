Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'image/new'
  get 'image/edit'
  get 'image/show'
  
  # resources :homes
  root "homes#index"
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :projects do
  # 	resources :avatar,:task
  # end
  # projects path
   get 'projects/new', as: :new_project
   post 'projects/create', as: :create_projects
   get 'projects/show', as: :projects, to: 'projects#show'
   get 'projects', as: :project, to: 'projects#index'
   # task path
   get 'task/new', as: :new_task, to: 'task#new'
   post 'task', as: :create_task, to: 'task#create'
   get 'task/show', as: :task, to: 'task#show'
   get 'task', as: :tasks, to: 'task#index'
   # avatar path
   get 'avatar',as: :avatars, to: 'avatar#index'
   get 'avatar/new', as: :new_avatar, to: 'avatar#new'
   post 'avatar', as: :create_avatar, to: 'avatar#create'
   get 'avatar/show',as: :avatar, to: 'avatar#show'
   post 'image/create',as: :create_image,to: 'image#create'

end
