Inschrijfformulier::Application.routes.draw do
  resources :event_participations

  devise_for :participants, :controllers => { :registrations => 'participants', :omniauth_callbacks => "participants/omniauth_callbacks" }
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
