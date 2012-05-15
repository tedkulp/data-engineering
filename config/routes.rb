DataEngineering::Application.routes.draw do

  resources :uploads, :except => [:update, :edit]

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout

  root :to => 'uploads#index'

end
