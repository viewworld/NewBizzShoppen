Nbs::Application.routes.draw do

  resources :payment_notifications

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
    resources :articles
    resources :news
    resources :currencies
    namespace :invoicing do
      resources :invoices do
        resources :invoice_lines
        resource :cash_flow, :only => [:new, :create], :controller => "CashFlow"
        resource :invoice_lines_payable, :only => :new, :controller => "InvoiceLinesPayable"
        resources :mailings, :only => [:new, :create]
      end
      resource :bulk_invoice_update, :controller => "bulk_invoice_update", :only => [:update]
      resources :upcoming_invoices, :only => [:index]
      resources :payment_transactions
    end
  end

  namespace :buyers do
    root :to => "lead_purchases#index"
    resources :cart_items
    resource :cart, :only => [:show, :destroy], :controller => 'cart'
    resources :lead_purchases do
      collection do
        put :bulk_update
      end
      resource :lead_email, :only => [:new,:create]
    end
    resource :bulk_cart_items, :controller => "bulk_cart_items", :only => [:create]
  end
  match 'buyers/bulk_lead_purchase_csv' => 'buyers/bulk_lead_purchase_csv#create', :as => "bulk_lead_purchase_csv"
  match 'buyers/bulk_lead_purchase_print' => 'buyers/bulk_lead_purchase_print#create', :as => "bulk_lead_purchase_print"
  match 'buyers/bulk_lead_purchase_update' => 'buyers/bulk_lead_purchase_update#create', :as => "bulk_lead_purchase_update"
  match 'buyers/bulk_lead_share_by_email' => 'buyers/bulk_lead_share_by_email#new', :as => "bulk_lead_share_by_email"
  match 'buyers/create_bulk_lead_share_by_email' => 'buyers/bulk_lead_share_by_email#create', :as => "create_bulk_lead_share_by_email"

  namespace :call_centres do
    root :to => "call_centre_agents#index"
    resources :call_centre_agents
    resource :bulk_call_centre_agents_update, :controller => "bulk_call_centre_agents_update", :only => [:update]
  end

  namespace :lead_users do
    root :to => "lead_purchases#index"
    resources :lead_purchases do
      resource :lead_email, :only => [:new,:create]
    end
    resources :lead_requests
    resource :bulk_lead_requests, :controller => "bulk_lead_requests", :only => [:create, :destroy]
    resource :bulk_lead_purchase_update, :controller => "bulk_lead_purchase_update", :only => [:create]
    resource :bulk_lead_purchase_csv, :controller => "bulk_lead_purchase_csv", :only => [:create]
    resource :bulk_lead_purchase_print, :controller => "bulk_lead_purchase_print", :only => [:create]
  end

  namespace :customers do
    root :to => "lead_requests#index"
    resource :interests, :only => [:edit, :update]
    resources :subaccounts
    resources :lead_requests, :only => [:index, :update, :destroy]
    resource :bulk_lead_requests, :controller => "bulk_lead_requests", :only => [:destroy,:update]
    resource :bulk_subaccounts_update, :controller => "bulk_subaccounts_update", :only => [:update]
  end

  namespace :agents do
    root :to => "leads#index"
    resources :leads
  end

  namespace :purchase_managers do
    root :to => "leads#index"
    resources :leads
  end

  match 'buyer_home' => 'buyer_home#show', :as => "buyer_home"
  match 'agent_home' => 'agent_home#show', :as => "agent_home"
  match 'purchase_manager_home' => 'purchase_manager_home#show', :as => "purchase_manager_home"

  resources :leads, :only => [:index, :show]

  resources :categories, :only => [:index]
  match 'categories/:slag' => "leads#index"


  resources :agent_accounts, :only => [:new, :create]
  resources :buyer_accounts, :only => [:new, :create]
  resources :purchase_manager_accounts, :only => [:new, :create]
  resources :locales

  resources :news
  resources :articles
  resources :help_popups

  resource :my_profile, :controller => "my_profile", :only => [:update]
  match 'my_profile' => 'my_profile#edit', :as => "my_profile"

  resource :password, :controller => 'password', :only => [:update]
  match 'password' => 'password#edit', :as => 'password'
  match 'ckeditor/destroy/:id', :to => 'ckeditor#destroy'

  resource :contact_us, :controller => "contact_us", :as => "contact_us", :only => [:new, :create]
  match 'contact_us' => 'contact_us#new', :as => 'contact_us'

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
