Monsters::Application.routes.draw do

  resources :chapters


  resources :adventurers


  resources :overlord_cards


  resources :adventures


  resources :familiars


  resources :archetypes


  resources :skills


  resources :classes, :controller => :professions do
    member do
      get 'get_items'
      get 'get_skills'
    end
  end


  resources :items


  resources :heroes do
    member do
      get 'professions'
    end
  end


  get "static_pages/index"

  devise_for :users
  resources :users, :only => [:index, :show]

  

  resources :campaigns

  resources :quests do
    resources :encounters
  end

  resources :traits

  resources :games

  resources :monsters

  match 'generate_monster_list' => "encounters#generate_monster_list", :as => :generate_monster_list, :via => :get
  match 'search' => "search#index", :as => :search, :via => :get

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
  root :to => 'static_pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
