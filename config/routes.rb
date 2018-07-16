Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :busniesses

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/busniess/invite/:id' => 'busniesses#invite', as: 'busniess_invite'
  post '/busniess/invite/:id' => 'busniesses#invite'
end
