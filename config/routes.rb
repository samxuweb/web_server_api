Rails.application.routes.draw do

  post 'signin' => 'users#create'
  post 'login' => 'users#login'
  post 'update_info' => 'users#update_info'
  post 'get_info' => 'users#get_info'
  post 'update_setting' => 'users#update_setting'
  post 'get_setting' => 'users#get_setting'
  post 'lost_password' => 'users#lost_password'
  post 'set_password' => 'users#set_password'
  post 'upload' => 'revisions#upload'
  get 'download' => 'revisions#download'
  post 'upload_head_portrait' => 'users#upload_head_portrait'
  get 'get_head_portrait' => 'users#get_head_portrait'
  get 'revisions' => 'revisions#index'
  get 'get_version' => 'revisions#get_version'
  post 'update_sport_time' => 'users#update_sport_time'
  post 'get_sport_time' => 'users#get_sport_time'
  post 'update_completion' => 'users#update_completion'
  post 'get_completion_lists' => 'users#get_completion_lists'
  post 'get_current_completion' => 'users#get_current_completion'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
