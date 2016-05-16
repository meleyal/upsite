Rails.application.routes.draw do

  constraints :subdomain => /^(?!www\Z)(\w+)/ do
    get '/' => 'sites#show'
    get 'settings' => 'sites#edit'
    patch 'settings' => 'sites#update'
    get 'sites' => 'sites#index'
    resources :help, only: [:new, :create]
    resources :blocks, only: [:new, :create, :update, :destroy] do
      post 'shuffle', on: :collection
      post 'sort', on: :collection
    end
  end

  constraints :subdomain => /^(www)/ do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/signup', to: 'signups#new'
    post '/signup', to: 'signups#create'
    get '/terms', to: redirect('/legal')
    get '/privacy', to: redirect('/legal')
    get '/legal', to: 'website#legal'
    root 'website#index'
  end

end
