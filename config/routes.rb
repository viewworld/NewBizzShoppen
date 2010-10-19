Nbs::Application.routes.draw do


  get "agent_home/show"

  get "buyer_home/show"

  devise_for :users do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end


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

  namespace :administration do
    root :to => "users#index"
    resources :users do
      resource :password, :controller => 'password'
    end
  end

  namespace :buyer do
    root :to => "buyer_leads#index"
  end

  namespace :agent do
    root :to => "agent_leads#index"
  end

  match 'buyer_home' => 'buyer_home#show', :as => "buyer_home"
  match 'agent_home' => 'agent_home#show', :as => "agent_home"

  resources :agent_accounts, :only => [:new, :create]
  resources :buyer_accounts, :only => [:new, :create]




  resource :my_profile, :controller => "my_profile", :only => [:update]
  match 'my_profile' => 'my_profile#edit', :as => "my_profile"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  root :to => "home#show"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
