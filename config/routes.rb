Inschrijfformulier::Application.routes.draw do
  resources :event_participations

  match '/auth/:provider/callback' => 'authentications#create'  

  devise_for :participants, :controllers => { :registrations => 'registrations' }
  resources :authentications
  resources :entries do
    resources :steps, controller: 'entries/steps'
  end
  
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
