Nbs::Application.routes.draw do

  get "agent_home/show"
  get "buyer_home/show"

  devise_for :users, :controllers => {:passwords => "users/passwords"}

  devise_for :users do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end

  match 'bulk_action' => 'bulk_actions#create', :as => :bulk_action

  namespace :administration do
    root :to => "users#index"
    resources :users do
      resource :password, :controller => 'password'
    end
    resources :categories
    resource :setting, :only => [:edit, :update]
    resources :email_templates
    resources :leads
  end

  namespace :buyers do
    root :to => "lead_purchases#index"
    resource :interests, :only => [:edit, :update]
    resources :cart_items
    resource :cart, :only => [:show, :destroy], :controller => 'cart'
    resources :lead_purchases do
      collection do
        put :bulk_update
      end
    end
    resource :bulk_cart_items, :controller => "bulk_cart_items", :only => [:create]
  end
  match 'buyers/bulk_lead_purchase_csv' => 'buyers/bulk_lead_purchase_csv#create', :as => "bulk_lead_purchase_csv"
  match 'buyers/bulk_lead_purchase_print' => 'buyers/bulk_lead_purchase_print#create', :as => "bulk_lead_purchase_print"
  match 'buyers/bulk_lead_purchase_update' => 'buyers/bulk_lead_purchase_update#create', :as => "bulk_lead_purchase_update"
  match 'buyers/bulk_lead_share_by_email' => 'buyers/bulk_lead_share_by_email#new', :as => "bulk_lead_share_by_email"
  match 'buyers/create_bulk_lead_share_by_email' => 'buyers/bulk_lead_share_by_email#create', :as => "create_bulk_lead_share_by_email"


  namespace :lead_users do
    root :to => "lead_purchases#index"
    resources :lead_purchases
    resources :lead_requests
    resource :bulk_lead_requests, :controller => "bulk_lead_requests", :only => [:create, :destroy]
    resource :bulk_lead_purchase_update, :controller => "bulk_lead_purchase_update", :only => [:create]
  end

  namespace :customers do
    root :to => "lead_requests#index"
    resources :subaccounts
    resources :lead_requests, :only => [:index, :update, :destroy]
    resource :bulk_lead_requests, :controller => "bulk_lead_requests", :only => [:destroy]
  end

  namespace :agents do
    root :to => "leads#index"
    resources :leads
  end

  match 'buyer_home' => 'buyer_home#show', :as => "buyer_home"
  match 'agent_home' => 'agent_home#show', :as => "agent_home"

  resources :leads, :only => [:index, :show]
  resources :categories, :only => [:index]

  resources :agent_accounts, :only => [:new, :create]
  resources :buyer_accounts, :only => [:new, :create]
  resources :locales

  resource :my_profile, :controller => "my_profile", :only => [:update]
  match 'my_profile' => 'my_profile#edit', :as => "my_profile"

  resource :password, :controller => 'password', :only => [:update]
  match 'password' => 'password#edit', :as => 'password'

  root :to => "home#show"

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
