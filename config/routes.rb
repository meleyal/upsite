Rails.application.routes.draw do

  constraints :subdomain => /ads/ do
    get '/click/:id', to: 'ads#show', as: 'ad'
  end

  constraints :subdomain => /^(?!www\Z)(\w+)/ do
    get '/' => 'sites#show'
    get 'settings' => 'sites#edit'
    patch 'settings' => 'sites#update'
    get 'upgrade' => 'sites#upgrade'
    get 'upgrade_confirm' => 'sites#upgrade_confirm'
    get 'sites' => 'sites#index'
    get 'sites/new' => 'sites#new', as: :new_site
    post 'sites' => 'sites#create'
    resources :help, only: [:new, :create]
    get 'help/:slug', to: 'help#show', as: 'help_article'
    resources :blocks, only: [:new, :create, :update, :destroy] do
      post 'sort', on: :collection
    end
    resources :charges
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
