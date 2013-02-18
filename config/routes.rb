Monsters::Application.routes.draw do

  get "timer/timer"

  match 'chapters/new_standalone' => "chapters#new_standalone", :as => :new_standalone_chapter, :via => :get
  resources :chapters


  resources :adventurers do
    member do
      delete 'remove_item'
      delete 'remove_skill'
    end
  end


  resources :overlord_cards


  resources :adventures do
    member do
      delete 'remove_overlord_item'
      delete 'remove_overlord_card'
    end
  end


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

  
  match 'search' => "search#index", :as => :search, :via => :get
  
  match 'monster_pool_generator' => "tools#monster_pool_generator", :as => :monster_pool_generator, :via => :get
  match 'generate_monster_pool' => "tools#generate_monster_pool", :as => :generate_monster_pool, :via => :get

  match 'dice_roller' => "dice#dice_roller", :as => :dice_roller, :via => :get
  match 'roll_dice' => "dice#roll_dice", :as => :roll_dice, :via => :get

  match 'turn_timer' => "timer#turn_timer", :as => :turn_timer, :via => :get

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
