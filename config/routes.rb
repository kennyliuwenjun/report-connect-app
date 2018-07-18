Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :busniesses

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/busniess/invite/:id' => 'busniesses#invite', as: 'busniess_invite'
  post '/busniess/invite/:id' => 'busniesses#invite'

  get '/busniess/:id/reports/new' => 'reports#new', as: 'reports_new'
  get '/busniess/:busniess_id/reports/:report_id' => 'reports#edit', as: 'edit_report'
  patch '/busniess/:busniess_id/reports/:report_id' => 'reports#update', as: 'update_report'
  put '/busniess/:busniess_id/reports/:report_id' => 'reports#update'

  post '/busniess/:id/reports' => 'reports#create', as: 'reports_create'
  delete '/reports/:id' => 'reports#destroy', as: 'reports_delete'
end
