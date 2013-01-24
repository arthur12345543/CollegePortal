CollegePortal::Application.routes.draw do

  devise_for :users
  devise_for :users do 
    get 'sign_out' => 'devise/sessions#destroy'
    get "log_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
  end
  delete "news/:id" => "news#destroy"
  delete "showbills/:id" => "showbills#destroy"
  
  get "users/set_role/:id" => "users#set_role" 
  get "users/select_role"
  get "users" => "users#show_all"
  get "users/:id"  => "users#show" 
  get "users/SetPrivateRules/:id/:role_id"  => "users#chenge_private_role" 
  
  get "roles" => "roles#index"
  get "roles/new"
  post "roles" => "roles#create"
  delete "roles" => "roles#destroy"
  
  resources :news

  resources :showbills
  
  resources :albums

  resources :photos
  
  resources :uploads
  
  resources :schedules

  resources :count_lessons

  resources :lessons

  resources :groups

  resources :days

  resources :audiences
  
  resources :contacts

  resources :data1s

  resources :data2s

  resources :data3s

  resources :lecturers
  
  root :to => 'home#index'


end
