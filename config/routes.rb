CMylaiseS::Application.routes.draw do
  #resources :characters

  %w(characters guilds votes).each do |r|
    get "ladder/#{r}" => "ladder##{r}", as: "ladder_#{r}"
  end

  get "staff/index", as: 'staff'

  resources :screens

  resources :comments

  resources :articles do
    resources :comments
  end

  post "profile/vip" => "profile#become_vip"
  %w(vip main_char).each do |r|
    get "profile/#{r}" => "profile##{r}", as: r
  end
  
  resources :accounts, only: [:index, :new, :create, :show] do
    resources :logs, only: :index
  end
  
  resource :session
  
  get 'vote' => 'points#vote'
  get 'code' => 'points#code'
  post 'credit' => 'points#credit'
  
  %w(join_us help shop).each do |r|
    get r => "Misc##{r}"
  end
 
  root to: 'articles#index'

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
