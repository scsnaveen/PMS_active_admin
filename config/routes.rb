Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
    get 'users/sign_in'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'image/new'
  get 'image/edit'
  get 'image/show'
  
  # resources :homes
  root "homes#index"
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :projects do
  # 	resources :avatar,:task
  # end
   get 'projects/new', as: :new_project
   post 'projects/create', as: :create_projects
   get 'projects/show', as: :projects, to: 'projects#show'
   get 'projects', as: :project, to: 'projects#index'
   get '/projects/:project_id/task/new', as: :new_project_task, to: 'task#new'
   post '/projects/:project_id/task', as: :create_task, to: 'task#create'
   get '/projects/:project_id/task/show', as: :projects_task, to: 'task#show'
   get '/projects/:project_id/task', as: :project_task_index, to: 'task#index'
   get '/projects/:project_id/avatar',as: :project_avatar_index, to: 'avatar#index'
   get '/projects/:project_id/avatar/new', as: :new_project_avatar, to: 'avatar#new'
   post '/projects/:project_id/avatar', as: :create_avatar, to: 'avatar#create'
   get '/projects/:project_id/avatar/show',as: :project_avatar, to: 'avatar#show'
   post 'image/create',as: :create_image,to: 'image#create'

end
