DataEngineering::Application.routes.draw do

  resources :customers, :only => [:index, :show]

  resources :orders, :only => [:index, :show]

  resources :items, :only => [:index, :show]

  resources :merchants, :only => [:index, :show]

  resources :uploads, :except => [:update, :edit]

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout

  root :to => 'uploads#index'

end
