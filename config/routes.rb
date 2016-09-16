Rails.application.routes.draw do
  root :to => 'sites#index'
  resources :sites
  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out
end
