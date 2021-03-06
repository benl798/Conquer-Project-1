Rails.application.routes.draw do

  root to: 'session#home'
  # get '/users/new' => 'users#new'
  # post '/users' => 'users#create'



  # Session routes:
  get  '/login' => 'session#new'     # login form

  # form submits here, do authentication & create session & redirect, or show form with errors
  post '/login' => 'session#create'

  delete '/login' => 'session#destroy'  # logout, i.e. delete session for this user

  post '/workouts/:id' => 'workouts#add_comment'

  # Users CRUD
  resources :users

  # Workouts CRUD
  resources :workouts

  # Exercises CRUD
  resources :exercises

  # Comments CRUD
  resources :comments

end
