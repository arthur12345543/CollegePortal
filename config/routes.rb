CollegePortal::Application.routes.draw do

  resources :news
  
  root :to => 'home#index'

end
