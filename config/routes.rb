Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #会員側
  
    root to: 'public/homes#top'
    # get 'homes/top'
    
    get '/about' => 'public/homes#about'
  
  scope module: :public do
    resources :shipping_addresses, only: [:index, :new, :show, :edit]
    # get 'shipping_addresses/index'
    # get 'shipping_addresses/edit'
    
    resources :orders, only: [:new, :completed, :index, :show]
    # get 'orders/new'
    # get 'orders/completed'
    # get 'orders/index'
    # get 'orders/show'
    
    # resource
    resource :cart_items, only: [:index]
    # get 'cart_items/index'
    
    resources :customers, only: [:show, :edit, :confirm]
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/confirm'
    
    resources :items, only: [:index, :show]
    # get 'items/index'
    # get 'items/show'
  end
  


  #管理者側

  namespace :admin do
    get 'orders/show'
    
    resources :customers, only: [:index, :show, :edit]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    
    resources :genres, only: [:index, :edit]
    # get 'genres/index'
    # get 'genres/edit'
    
    resources :items, only: [:index, :new, :show, :edit]
    # get 'items/index'
    # get 'items/new'
    # get 'items/show'
    # get 'items/edit'
    
    get 'homes/top'
  end



  
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
