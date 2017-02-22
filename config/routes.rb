Rails.application.routes.draw do
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
  
  resources :suppliers
  #get 'stock/articles/index'
  
  
  root 'stock/articles#index'
end
