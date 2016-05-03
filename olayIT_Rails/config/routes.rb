Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get "login" => "sessions#new", :as => "login"
  delete 'logout' => "sessions#destroy", :as => "logout"
  resources :sessions

  post "home/buy"
  post "home/updatecart"
  post "home/checkout"
  get "cart" => "home#cart", :as => "cart"

  resources :promotions
  get 'reports/reportListing'

  get 'reports/customerList'

  get 'reports/productList'

  get 'reports/saleList'

  resources :order_items
  resources :orders
  resources :categories
  resources :reorders
  resources :reviews
  resources :squads
  resources :customers
  get 'home/index'

  get 'home/about'

  get 'home/contact'

  get "home/privacy"

  get "home/help"

  get 'home/catalog'

  get "home/squadSearch"

  post "home/squadSearch"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
