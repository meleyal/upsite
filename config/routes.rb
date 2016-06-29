Rails.application.routes.draw do

  constraints :subdomain => /^(?!www\Z)(\w+)/ do
    get '/' => 'sites#show'
    get 'settings' => 'sites#edit'
    patch 'settings' => 'sites#update'
    get 'sites' => 'sites#index'
    resources :help, only: [:new, :create]
    get 'help/:slug', to: 'help#show', as: 'help_article'
    resources :blocks, only: [:new, :create, :update, :destroy] do
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
    get '/business', to: 'landing_pages#business'
    root 'website#index'
  end

end
