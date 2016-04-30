Rails.application.routes.draw do

  constraints :subdomain => /^(?!www\Z)(\w+)/ do
    get '/' => 'sites#show'
    get 'settings' => 'sites#edit'
    patch 'settings' => 'sites#update'
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
    get '/terms', to: 'website#terms'
    get '/privacy', to: 'website#privacy'
    get '/faq', to: 'website#faq'
    root 'website#index'
  end

end
