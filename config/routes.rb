Rails.application.routes.draw do
  root :to => 'sites#index'
  resources :sites do
    collection do
      get 'autocomplete'
    end
  end

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

  resources :admins, only: [] do
    resources :posts, except: [:index]
  end
  get '/posts' => 'posts#index'

  resources :links
  get "/real-world" => "volunteer_sites#index"

  get "/about" => "pages#about"
  get "/volunteer" => "pages#volunteer"
  get '/admin' => 'pages#admin'
end
