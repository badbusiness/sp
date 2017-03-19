Rails.application.routes.draw do
  
  resources :comments
  resources :examples
##  get 'supplier/new'

  get 'suppliers', to: 'suppliers#index'

  namespace :example do
    resources :resources
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
   namespace :stock do
      resources :articles
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
