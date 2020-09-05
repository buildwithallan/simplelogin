Rails.application.routes.draw do
  get 'dashboard/index'
  root 'dashboard#index'

  resources :students

  #login page with form
  get '/login' => 'sessions#new'
 
  #create(post) action for when login for is submitted
  post '/login' => 'sessions#create'

  #delete action to logout
  get '/logout' => 'sessions#destroy'

end
