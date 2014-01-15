FirstApp::Application.routes.draw do

  get '/signin',     :to => 'sessions#new'
  get '/signout',    :to => 'sessions#destroy'
  get '/:championship_name/ranking', :to => 'stats#show_ranking'
  get '/:championship_name/matches/played', :to => 'stats#show_played_matches'
  get '/:championship_name/matches/future', :to => 'stats#show_future_matches'
  get '/:championship_name/teams/:team_name', :to => 'stats#show_team'
  get '/:championship_name/matches/:match_id', :to => 'stats#show_match'

  root :to => 'stats#show_home'

  get "sessions/new"

  resources :timekeepers

  post 'matches/matchsheet/:id/', :to => 'matches#matchsheet'
  resources :matches


  resources :gyms


  resources :members


  resources :championships


  resources :seasons


  resources :clubs


  resources :federations

  get 'teams/:id/getPlayers/', :to => 'teams#getPlayers'
  resources :teams


  resources :microposts


  resources :users
  resources :timekeepers

  resources :facts, :type => 'Fact', :controller => 'facts'
  resources :goals, :type => 'Goal', :controller => 'facts'
  resources :cards, :type => 'Card', :controller => 'facts'

  resources :participants, :type => 'Participant', :controller => 'participants'
  resources :coaches, :type => 'Coach', :controller => 'participants'
  resources :players, :type => 'Player', :controller => 'participants'
  resources :referees, :type => 'Referee', :controller => 'participants'

  resources :sessions, :only => [:new, :create, :destroy]

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"


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
