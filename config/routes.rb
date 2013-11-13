Asudisc::Application.routes.draw do
  get "dashboard/members"

  match '/payment_notification', :to => 'payment_notifications#create'

  devise_for :users
  resources :events
  resources :profile
  resources :jobs
  resources :courses

  #Events
  match '/events/:id/attendance/', :to => 'events#attendance'
  match '/events/:id/attend/', :to => 'events#attend', :as => :attend_event
  match '/calendar', :to => 'events#calendar'

  #User stuff
  match '/members', :to => 'profile#index'
  match '/dues', :to => 'profile#dues'
  match '/dues_error', :to => 'profile#dues_error'
  match '/dues_successful', :to => 'profile#dues_successful'
  match '/profile/:id/make_admin', :to => 'profile#make_admin', :as => :make_admin

  #Navigation
  match '/about', :to => 'navigation#about'
  match '/for_companies', :to => 'navigation#for_companies'
  match '/executive_team', :to => 'navigation#executive_team'
  match '/donate', :to => 'navigation#donate'
  get "navigation/index"
  get "navigation/jobs"
  match '/microsoft', :to => 'navigation#microsoft'
  root :to => 'navigation#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
