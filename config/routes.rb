Rails.application.routes.draw do

  # get 'people/index'

  # get 'people/edit'

  # get 'people/new'

  # get 'people/show'

  resources :reports, param: :report_uid do
    get '/people/new', :to => 'reports#people_new'
    post '/people', :to => 'reports#create_and_relate_person'
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
