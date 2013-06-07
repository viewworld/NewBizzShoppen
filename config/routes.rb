Nbs::Application.routes.draw do

  resources :payment_notifications, :only => [:create] do
    member do
      post 'show'
    end
  end

  get "agent_home/show"
  get "supplier_home/show"

  devise_for :users, :controllers => {:passwords => "users/passwords"}

  devise_for :users do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end

  match 'bulk_action' => 'bulk_actions#create', :as => :bulk_action

  namespace :administration do
    root :to => "homes#show"
    resources :users do
      resource :password, :controller => 'password', :only => [:new, :update, :destroy]
      member do
        get :sign_in_as
        get :lock
        get :unlock
      end
      resource :change_subscription_plan
    end
    resource :bulk_users_update, :controller => "bulk_users_update", :only => [:update]
    resources :categories
    resources :category_email_templates, :only => [:edit, :update]
    resource :setting, :only => [:edit, :update]
    resources :featured_deals, :only => [:index, :create]
    resources :email_templates do
      member do
        post 'test_send_email'
      end
    end
    resources :leads
    resources :deals do
      resources :assets, :controller => "deal_assets", :only => [:create, :destroy]
    end
    resources :articles
    resources :news
    resources :hints
    resources :currencies
    namespace :invoicing do
      resources :invoices do
        resources :invoice_lines
        resource :cash_flow, :only => [:new, :create], :controller => "CashFlow"
        resource :invoice_lines_payable, :only => :new, :controller => "InvoiceLinesPayable"
        resources :mailings, :only => [:new, :create]
        resource :seller, :only => [:update]
      end
      resource :bulk_mailings, :controller => "bulk_mailings", :only => [:edit, :update]
      resource :bulk_invoice_update, :controller => "bulk_invoice_update", :only => [:update]
      resource :bulk_invoice_users, :controller => "bulk_invoice_users", :only => [:update]
      resources :upcoming_invoices, :only => [:index]
      resources :payment_transactions
      resources :credit_notes
      resources :creditors
      resources :refunds
    end
    resources :bank_accounts
    resources :vat_rates
    resources :lead_templates
    resources :sellers
    resources :category_users
    resources :countries
    resource :translation do
      resource :cache
    end
    resource :stats_recalculation, :controller => "stats_recalculation", :only => [:update]
    resources :supplier_interests, :only => [:edit, :update]
    resources :youtube_introductions
    resources :email_bounces
    resources :languages
    resources :subscription_plans do
      collection do
        get 'fetch_subscription_plans'
      end
    end
    resources :paypal_notifications, :only => [:index, :show]
    resources :tags do
      member do
        post 'duplicate'
      end
    end
    match '/dashboard' => 'dashboard#index', :as => 'dashboard'
    resources :results
    resources :payouts do
      member do
        put 'call_result'
        put 'campaign_result'
      end
      collection do
        get 'agents'
        get 'campaigns'
      end
    end
  end

  namespace :newsletters do
    root :to => "newsletter_lists#index"
    resources :newsletter_lists do
      resources :newsletter_synchronizations
      collection do
        get 'sourceable_for_search'
      end
      member do
        post 'archive'
        post 'unsubscribe'
      end
    end

    resources :newsletter_campaigns do
      collection do
        get 'lists_for_owner'
      end
      member do
        post 'archive'
      end
    end
  end

  namespace :suppliers do
    root :to => "lead_purchases#index"
    resources :cart_items
    resources :deal_certification_requests, :only => [:index, :edit, :update]
    resources :deals do
      resources :assets, :controller => "deal_assets", :only => [:create, :destroy]
    end
    resource :cart, :only => [:show, :update, :destroy], :controller => 'cart'
    resources :lead_purchases do
      collection do
        put :bulk_update
      end
      resource :lead_email, :only => [:new, :create]
    end
    resource :bulk_cart_items, :controller => "bulk_cart_items", :only => [:create]
  end
  match 'suppliers/bulk_lead_purchase_export' => 'suppliers/bulk_lead_purchase_export#create', :as => "bulk_lead_purchase_export"
  match 'suppliers/bulk_lead_purchase_print' => 'suppliers/bulk_lead_purchase_print#create', :as => "bulk_lead_purchase_print"
  match 'suppliers/bulk_lead_purchase_update' => 'suppliers/bulk_lead_purchase_update#create', :as => "bulk_lead_purchase_update"
  match 'suppliers/bulk_lead_share_by_email' => 'suppliers/bulk_lead_share_by_email#new', :as => "bulk_lead_share_by_email"
  match 'suppliers/create_bulk_lead_share_by_email' => 'suppliers/bulk_lead_share_by_email#create', :as => "create_bulk_lead_share_by_email"

  namespace :call_centres do
    root :to => "call_centre_agents#index"
    resources :call_centre_agents do
      resource :password, :controller => 'password', :only => [:new, :update, :destroy]
    end
    resources :deals do
      resources :assets, :controller => "deal_assets", :only => [:create, :destroy]
    end
    resource :bulk_call_centre_agents_update, :controller => "bulk_call_centre_agents_update", :only => [:update]
    resources :leads
    resources :lead_templates
    resources :news
  end

  namespace :call_centre_agents do
    root :to => "leads#index"
    resources :leads do
      resources :certifications, :only => :create
    end
    resources :lead_templates
    resources :deals do
      resources :assets, :controller => "deal_assets", :only => [:create, :destroy]
    end
  end

  namespace :lead_users do
    root :to => "lead_purchases#index"
    resources :lead_purchases do
      resource :lead_email, :only => [:new, :create]
    end
    resources :lead_requests
    resource :bulk_lead_requests, :controller => "bulk_lead_requests", :only => [:create, :destroy]
    resource :bulk_lead_purchase_update, :controller => "bulk_lead_purchase_update", :only => [:create]
    resource :bulk_lead_purchase_export, :controller => "bulk_lead_purchase_export", :only => [:create]
    resource :bulk_lead_purchase_print, :controller => "bulk_lead_purchase_print", :only => [:create]
  end

  namespace :suppliers do
    root :to => redirect("/suppliers/lead_purchases")
    resource :interests, :only => [:edit, :update]
    resources :subaccounts
    resources :lead_requests, :only => [:index, :update, :destroy]
    resource :bulk_lead_requests, :controller => "bulk_lead_requests", :only => [:destroy, :update]
    resource :bulk_subaccounts_update, :controller => "bulk_subaccounts_update", :only => [:update]
    resources :not_invoiced_leads, :only => [:index]
    resources :invoices, :only => [:show, :index]
    resources :lead_templates
    resources :newsletter_lists do
      resources :newsletter_synchronizations
    end
  end

  namespace :agents do
    root :to => "leads#index"
    resources :lead_templates
    resources :leads do
      resources :certifications, :only => :create
    end
    resources :deals do
      resources :assets, :controller => "deal_assets", :only => [:create, :destroy]
    end
  end

  namespace :members do
    root :to => "leads#index"
    resources :leads, :path => :requests do
      member do
        get 'redirect_to_paypal'
        get 'pdf'
      end
    end
    resources :tenders, :path => :leads do
      resources :certifications, :only => :create
    end
    resources :lead_templates
  end

  namespace :callers do
    resources :chain_mail_types, :controller => "chain_mail_types"
    resources :chain_mail_items
    resources :chain_mail_materials
    resources :campaigns do
      resources :materials
      member do
        post 'result_details'
        post 'export_result_details'
        get 'contacts_for_search'
        post 'duplicate'
      end
      collection do
        post 'results'
      end
      resources :results, :except => :show do
        collection do
          post 'batch_assign'
        end
      end
      resources :campaigns_users, :only => [:index, :update]
      resource :campaigns_description, :controller => "campaigns_description", :only => [:show, :edit, :update]
      resources :contacts do
        collection do
          post 'batch_remove'
          post 'batch_assign'
          post 'batch_move'
          post 'bulk_contacts_export'
          post 'import_xls'
          post 'batch_add_to_newsletter_list'
        end
      end
      resources :advanced_import, :only => [:create, :destroy] do
        collection do
          post 'choose'
          post 'preview'
        end
      end
      resources :agent_work_screen, :only => :index
      namespace :agent_work_screen do
        resources :contacts, :only => [:create, :show, :destroy, :update] do
          resources :call_results, :only => [:new, :create, :edit, :update, :destroy]
        end
        resource :call_sheet, :only => [:show]
        resource :pending_call, :only => [:show]
        resource :complete_contact, :only => [:show]
      end
      resources :email_templates, :only => [:edit, :update] do
        member do
          post 'test_send_email'
        end
      end
      resources :chain_mail_types, :controller => "chain_mail_types"
      resources :call_results
      resources :call_logs
    end

    resource :production, :controller => "production", :only => [:show] do
      member do
        get 'export'
      end
    end
    resource :history, :controller => "history", :only => [:show]
    resource :communication, :controller => "communication", :only => [:show]

    resources :contacts do
      resources :call_results, :only => [:new, :create, :edit, :update, :destroy]
    end

    resources :campaign_reports do
      collection do
        post 'load_agents'
      end
    end

    resources :agent_timesheets, :only => [:index,:show,:destroy,:create,:new]
    resources :cached_timesheets, :only => [:index]
    resources :cached_campaign_reports, :only => [:index]
    resource :agent_information, :only => [:show]
    resource :agent_performance do
      member do
        get :summary
      end
    end
    resources :call_logs
  end

  namespace :comments do
    resources :threads
    resources :leads do
      resources :threads
    end
    resources :replies
    resources :blocked_conversations, :only => [:create, :destroy]
    resources :comment_readers, :only => [:create]
  end

  namespace :deal_comments do
    resources :threads
    resources :deals, :only => [:show] do
      resources :threads
    end
    resources :replies
    resources :comment_readers, :only => [:create]
  end

  namespace :users do
    resources :delayed_jobs do
      collection do
        get :delete_all
      end
    end
  end

  namespace :flashphoner do
    resource :login
  end

  resources :chain_mails

  match 'supplier_home' => 'supplier_home#show', :as => "supplier_home"
  match 'agent_home' => 'agent_home#show', :as => "agent_home"
  match 'member_home' => 'member_home#show', :as => "member_home"

  resources :leads, :except => [:new, :create, :destroy] do
    collection do
      post :creators
    end
  end

  resources :deals, :except => [:new, :create, :destroy] do
    member do
      post 'rate'
    end
    collection do
      get 'show_all'
      get 'insert_rich_content'
    end
  end

  resources :group_deals, :only => [:show]

  resources :categories, :only => [:index] do
    resources :more_leads_requests, :only => [:new, :create]
  end
  resources :deal_categories, :only => [:index]

  match 'categories/:slag' => "leads#index"
  match 'categories/deals/:slag' => "deals#index", :as => :deals_index

  resources :voucher_numbers, :only => [:edit, :update]
  resource :validate_voucher, :controller =>"validate_voucher", :only => [:show, :create]
  resource :use_voucher, :controller =>"use_voucher", :only => [:show, :create]

  resource :contacts_advanced_import, :only => [:create, :destroy, :show] do
    collection do
      post 'choose'
      post 'preview'
    end
  end

  resource :leads_advanced_import, :only => [:create, :show] do
    collection do
      post 'choose'
      post 'preview'
    end
  end

  resource :members_advanced_import, :only => [:create, :show] do
    collection do
      post 'choose'
      post 'preview'
    end
  end

  resource :suppliers_advanced_import, :only => [:create, :show] do
    collection do
      post 'choose'
      post 'preview'
    end
  end

  resources :agent_accounts, :only => [:new, :create]
  resources :supplier_accounts, :only => [:new, :create]
  resources :member_accounts, :only => [:new, :create]
  resources :category_supplier_accounts, :only => [:new, :create]
  resources :certification_accounts, :only => [:new, :create]
  resources :deal_supplier_accounts, :only => [:new, :create]
  resources :locales
  resources :phone_codes
  resources :regions
  resources :category_requests, :only => [:new, :create]
  resources :deal_requests, :only => [:create]
  resources :category_interests, :only => [:create]

  resources :news
  resources :articles
  resources :help_popups
  resources :login_keys
  resources :paypal_unpaid_invoices

  resource :my_profile, :controller => "my_profile", :only => [:update] do
    member do
      post 'social_link'
      put 'social_unlink'
      get 'unlink'
      put 'remove_category_supplier'
    end
    resources :subscription_plans, :only => [] do
      collection do
        get 'cancel'
      end
      member do
        get 'upgrade'
        get 'downgrade'
        get 'paypal_subscription'
        get 'paypal_confirmed'
        get 'paypal_canceled'
        get 'paypal_renew'
      end
    end
  end

  match 'my_profile' => 'my_profile#edit', :as => "my_profile"

  resource :password, :controller => 'password', :only => [:update]
  match 'password' => 'password#edit', :as => 'password'
  match 'ckeditor/destroy/:id', :to => 'ckeditor#destroy'

  resource :contact_us, :controller => "contact_us", :as => "contact_us", :only => [:new, :create]
  resource :terms_and_conditions, :controller => "terms_and_conditions", :as => "terms_and_conditions", :only => [:show]
  match 'contact_us' => 'contact_us#new', :as => 'contact_us'

  resource :lead_templates

  resource :user_session_log, :controller => "user_session_log", :only => [:create]

  resource :share_deal_by_email, :controller => "share_deal_by_email", :only => [:new, :create]

  resources :deal_maker_users

  resources :deal_maker_materials

  resources :remote_deal_requests

  resources :notifications, :only => [:index, :update]

  resources :tags, :only => [:index, :create]

  resources :email_templates, :only => [:edit, :update] do
    member do
      post 'test_send_email'
    end
  end

  resource :unconfirmed_paypal_subscriptions, :only => [:show]

  constraints(Fairdeals) do
    match '/all_deals' => "fairdeals_home#index"
    match '/(:id)' => "fairdeals_home#show"
  end

  constraints(Faircalls) do
    match '/(:id)' => "agent_home#show"
  end

  namespace :surveys_management do
    resources :surveys do
      resources :survey_questions do
        collection do
          post :sort
        end
        member do
          put :remove_parent
        end
      end
      member do
        post :send_to_newsletters
      end
    end
  end

  resources :survey_recipients, :only => [:show, :update]

  match ':slug' => 'category_home#show', :as => :category_home_page
  match ':slug/account/new' => 'category_supplier_accounts#new', :as => :new_category_home_page_account
  match ':slug/account' => 'category_supplier_accounts#create', :as => :category_home_page_account
  match ':slug/leads' => 'category_suppliers/leads#index', :as => :category_home_page_leads
  match 'survey/:id' => 'survey_recipients#show'

  root :to => "supplier_home#show"

  ActiveAdmin.routes(self)

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
