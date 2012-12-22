CollegePortal::Application.routes.draw do

  devise_for :users
  devise_for :users do 
    get 'sign_out' => 'devise/sessions#destroy'
    get "log_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
  end
  delete "news/:id" => "news#destroy"
  delete "showbills/:id" => "showbills#destroy"
  
  get "users/set_role"
  get "users/set_teacher"
  get "users/set_student"
  get "users/show_all" 
  
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
  
  root :to => 'home#index'


end
