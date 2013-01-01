Inschrijfformulier::Application.routes.draw do

  get "meetings_controller/index"

  get "meetings_controller/new"

  get "meetings_controller/create"

  get "meetings_controller/edit"

  get "meetings_controller/update"

  get "meetings_controller/destroy"

  resources :event_participations

  match '/auth/:provider/callback' => 'authentications#create'  

  devise_for :participants, :controllers => { :registrations => 'registrations' }
  resources :authentications
  resources :entries
  resources :events
  resources :clubs
  resources :colleges
  resources :sexes
  resources :days
  resources :volunteer_days
  resources :meetings
  
  as :participant do
   get '/login' => 'devise/sessions#new'
  end
  
  root :to => 'entries#home'
end
