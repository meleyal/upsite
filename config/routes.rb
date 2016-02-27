Rails.application.routes.draw do

  if Rails.env.development?
    resources :sites, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    constraints :subdomain => /^(?!www\Z)(\w+)/ do
      get '/' => 'sites#show'
      get 'settings' => 'settings#edit'
      patch 'settings' => 'settings#update'
      resources :help, only: [:new, :create]
      resources :blocks do
        resources :attachments, except: [:new, :edit], defaults: { format: 'json' }
      end
    end
  end

  get '/signup', to: 'signups#new'
  get '/signup/complete', to: 'signups#show'
  get '/terms', to: 'website#terms'
  get '/privacy', to: 'website#privacy'
  root 'website#index'

end
