Rails.application.routes.draw do
  resources :users, except: [:index]


  root 'users#login'
  # get 'event/:id/edit' =>

  get 'events/new' => 'events#new'

  get 'events/:id' => 'events#list_by_name', as: 'list_by_name'

  get 'signup' => "users#new", as: :signup

  get 'login' => "users#login", as: :login

  post 'login' => "users#authenticate"

  delete 'logout/id' => "users#logout", as: :logout
  resources :events


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # root 'events#index'
  # root list_by_name_path
  # root 'events#list_by_name'
  #get '/events/list' => 'events#list'


  get '/:parms' => "users#login"

  get '/list' => 'events#list'

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
