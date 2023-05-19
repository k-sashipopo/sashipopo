Rails.application.routes.draw do

# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #会員側

    root to: 'public/homes#top'

    get '/about' => 'public/homes#about'

  scope module: :public do
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]

    post 'orders/confirm'
    get 'orders/completed'
    resources :orders, only: [:new, :create, :index, :show]

    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only: [:index, :update, :destroy, :create]

    get 'customers/confirm'
    patch 'customers/resign'
    resources :customers, only: [:show, :edit, :update]

    resources :items, only: [:index, :show]
  end



  #管理者側

  namespace :admin do
    get 'homes/top'

    resources :orders, only: [:show, :update]
    
    patch 'order_details/update'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

  end
end
