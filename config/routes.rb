Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :businesses

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/business/invite/:id' => 'businesses#invite', as: 'business_invite'
  post '/business/invite/:id' => 'businesses#invite'

  get '/business/:id/reports/new' => 'reports#new', as: 'reports_new'
  get '/business/:business_id/reports/:report_id' => 'reports#edit', as: 'edit_report'
  patch '/business/:business_id/reports/:report_id' => 'reports#update', as: 'update_report'
  put '/business/:business_id/reports/:report_id' => 'reports#update'

  post '/business/:id/reports' => 'reports#create', as: 'reports_create'
  delete '/reports/:id' => 'reports#destroy', as: 'reports_delete'
end
