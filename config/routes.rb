Rails.application.routes.draw do

  resources :reports, param: :uuid do
    get '/people/new', :to => 'reports#people_new'
    post '/people', :to => 'reports#create_and_relate_person'
    patch '/reconcile', :to => 'reports#reconcile_and_create_owed'
    get '/results', :to => 'reports#results'
    resources :report_people
    resources :expenses
  end

  root 'welcome#index'

  # These routes will be for signup.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # These routes are for displaying a login form, login and logout.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
