Rails.application.routes.draw do

  resources :reports, param: :uuid do
    get '/people/new', :to => 'reports#people_new'
    post '/people', :to => 'reports#create_and_relate_person'
    patch '/reconcile', :to => 'reports#reconcile'
    get '/results', :to => 'reports#results'
    resources :report_people
    resources :expenses
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
