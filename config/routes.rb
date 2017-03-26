Rails.application.routes.draw do
  get '/' => 'pages#map'
  root :to => 'pages#map'
  resources :sites

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

  resources :admins, only: [] do
    resources :posts, except: [:index]
  end
  get '/posts' => 'posts#index'

  resources :links
  resources :volunteer_sites
  get "/real-world" => "volunteer_sites#index"

  get "/about" => "pages#about"
  get "/volunteer" => "pages#volunteer"
  get '/admin' => 'pages#admin'

  get '/submit_sites' => "submit_sites#new"
  post '/submit_sites' => "submit_sites#create"
  get '/edit_sites' => "edit_sites#new"
  post '/edit_sites' => "edit_sites#create"
end
