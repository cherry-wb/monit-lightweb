Monit::Application.routes.draw do

  resources :views

  #resources :services do
  #  resources :views do
  #    member do
  #      get :data
  #    end
  #  end
  #end

  resources :hosts do
    resources :services do
      resources :views do
        member do
        end
      end
      collection do
        get :types
      end
    end
  end

  resources :devices do
    resources :services do
      resources :views do
        member do
        end
      end
      collection do
        get :types
      end
    end
  end

  resources :apps do
    resources :services do
      resources :views do
        member do
        end
      end
      collection do
        get :types
      end
    end
  end

  resources :sites do
    resources :services do
      resources :views do
        member do
        end
      end
      collection do
        get :types
      end
    end

    member do
      get :confirm
      get :ctrl
      put :ctrl_update
    end
    collection do
      get :edit_notification
      put :batch_update
    end
  end

  match 'home' => 'home#index', :as => :home

  resources :tenants

  resources :users

  resources :users do
    member do
      put :suspend
      put :unsuspend
      delete :purge
    end
  end

  resource :session, :only => [:new, :destroy]
  #resource :session, :only => [:new, :create, :destroy]

  #match 'signup' => 'users#new', :as => :signup

  #match 'register' => 'users#create', :as => :register

  match 'login' => 'sessions#new', :as => :login

  match 'logout' => 'sessions#destroy', :as => :logout

  #match '/activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  match 'contact' => 'welcome#contact', :as => :contact
  match 'jobs' => 'welcome#jobs', :as => :jobs
  match 'about' => 'welcome#about', :as => :about
  match 'terms' => 'welcome#terms', :as => :terms
  get "welcome/index"
  root :to => "welcome#index"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
