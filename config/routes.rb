CollegePortal::Application.routes.draw do

  get "albums/index"

  get "albums/new"

  devise_for :users
  devise_for :users do 
    get 'sign_out' => 'devise/sessions#destroy'
    get "log_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
  end
  delete "news/:id" => "news#destroy"

  resources :news

  resources :albums
  
  resources :uploads
  
  root :to => 'home#index'

end
