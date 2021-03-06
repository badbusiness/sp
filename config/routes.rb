Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
 
  
  
  resources :comments
  resources :examples

  
  namespace :example do
    resources :resources
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
   namespace :stock do
      resources :articles
      resources :article_groups
      
  end
  
  namespace :sale do
    resources :order_lines
    resources :customers
    resources :orders
    resources :deliveries
  end
  
  namespace :purchase do 
    resources :order_lines 
    resources :suppliers do 
      get "update_name_from_id", to: 'suppliers#update_name_from_id'
    end
    resources :orders
  end
  
  #resources :suppliers
  #get 'stock/articles/index'
  
  
  root 'stock/articles#index'
end
