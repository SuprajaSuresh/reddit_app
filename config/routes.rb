RedditApp::Application.routes.draw do
  root :to => 'sessions#new'
  resources :sessions
  resources :top_stories
  delete "signout" => "sessions#destroy", :as => "signout"
end
