Aleprojectsdb::Application.routes.draw do
  resources :projects
  resources :my_projects
  resources :searches
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  root :to => "home#index"
end
