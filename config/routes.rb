Rails.application.routes.draw do
<<<<<<< HEAD
=======

>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #user devise
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    authenticated :user do
      root 'profile#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
  
<<<<<<< HEAD
  # You can have the root of your site routed with "root"
  root 'home#index'
  #get 'dash/' => 'test#index'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'stock/:id/in_stocks' => 'stocks#index_in_stock', as: :instock #route add for in_stock product in stock
  get 'profile/:id/account' => 'profile#account', as: :account #route account
  get 'profile/:id/password' => 'profile#password', as: :password #route account
  post 'profile/:id/account' => 'profile#update_account', as: :account_update #route account
  post 'profile/:id/password' => 'profile#update_password', as: :password_update #route account
  get 'search/' => 'search#index', as: :search #route account
=======

  # You can have the root of your site routed with "root"
  root 'home#index'
  #get 'dash/' => 'test#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
<<<<<<< HEAD
  resources :in_users
  resources :providers
  resources :categories
  resources :stocks
  resources :taxes

  resources :products do
    resources :prices
    resources :in_taxes
    resources :in_stocks
  end
  
  resources :sales do
    resources :items
    resources :pays
  end

  resources :clients
  resources :vendors
  resources :terminals 
  resources :in_terminals
  resources :in_vendors

  resources :orders do 
    resources :in_orders
  end
  resources :buys do 
    resources :in_buys
  end
  resources :tickets
  
  resources :payments
  resources :statuses
  resources :measures
=======
  resources :providers
  resources :clients
  resources :categories
  resources :products do
    resources :prices
    resources :taxes
  end
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
