Rails.application.routes.draw do

  resources :reports, param: :uuid do
    get '/people/new', :to => 'reports#people_new'
    post '/people', :to => 'reports#create_and_relate_person'
    resources :report_people
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
