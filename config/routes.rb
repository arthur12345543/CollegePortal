CollegePortal::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get "admins/index"

  get "admin/index"

  devise_for :users
  devise_for :users do 
    get 'sign_out' => 'devise/sessions#destroy'
    get "log_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
  end
  delete "news/:id" => "news#destroy"
  put "news/:id" => "news#update"
  get "news/:id/edit" => "news#edit"
  
  delete "showbill/:id" => "showbill#destroy"
  get "showbill" => "showbill#index"
  
  get "users/set_role/:id" => "users#set_role" 
  get "users/select_role"
  get "users" => "users#show_all"
  get "users/:id"  => "users#show" 
  post "users/SetPrivateRules/:id/:role_id"  => "users#chenge_private_role" 
  
  get "roles" => "roles#index"
  get "roles/new"
  post "roles" => "roles#create"
  delete "roles" => "roles#destroy"



  get "schedule" => "schedule#index"
  get "schedule/edit/:id" => "schedule#edit"
  get "schedule/replacement/:id" => "schedule#add_replacement"
  put "schedule/update" => "schedule#update"
  put "schedule/replacement" => "schedule#replacement_save"
  
  get "forum" => "forum#index"
  get "forum/topic/:id" => "posts#show_all"
  get "forum/new" => "forum#new"
  get "forum/new_theme"  => "forum#new_theme"
  post "forum" => "posts#create"
  
  get "content/:id"  => "content#index"
  
  
  

  get 'histories/first'
  get 'histories/second'

  resources :themes
  
  resources :partners
  
  resources :posts

  resources :feedbacks
  get "feedback/done" => "feedbacks#done" 
  get "feedback/all" => "feedbacks#show_all" 
  
  resources :sections

  resources :news

  resources :albums
  
  resources :content

  resources :photos
  
  resources :uploads
  
  resources :count_lessons

  resources :lessons

  resources :groups

  resources :audiences
  
  resources :contacts

  resources :lecturers

  resources :admins
  
  root :to => 'news#index'


end