Rails.application.routes.draw do
  root :to => 'sites#index'
  resources :sites
end
