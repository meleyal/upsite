Rails.application.routes.draw do

  constraints :subdomain => /^(?!www\Z)(\w+)/ do
    get '/' => 'sites#show'
    get '/source.md' => 'sites#source'
    get 'settings/:group' => 'settings#edit', as: 'settings',
      constraints: { group: /site|account|user|sites|experiments/ }
    patch 'settings/:group' => 'settings#update'
    get 'edit' => 'sites#edit'
    patch 'edit' => 'sites#update'
    get 'sites' => 'sites#index'
    get 'sites/new' => 'sites#new', as: :new_site
    post 'sites' => 'sites#create'
    resources :help, only: [:new, :create]
    get 'help/:slug', to: 'help#show', as: 'help_article'
    resources :blocks do
      post 'sort', on: :collection
      resources :attachments
    end
  end

  constraints :subdomain => /^(www)/ do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'signup', to: 'signups#new'
    post 'signup', to: 'signups#create'
    get 'cancel', to: 'signups#cancel'
    delete 'cancel', to: 'signups#destroy'
    get 'upgrade', to: 'subscriptions#new'
    get 'upgrade/cancel', to: 'subscriptions#cancel'
    post 'upgrade', to: 'subscriptions#create'
    delete 'upgrade', to: 'subscriptions#destroy'
    post 'upgrade/webhook', to: 'subscriptions#webhook'
    get 'terms', to: redirect('/legal')
    get 'privacy', to: redirect('/legal')
    get 'legal', to: 'website#legal'
    get 'roadmap', to: 'website#roadmap'
    get 'markdown', to: 'website#markdown'
    root 'website#index'
  end

end
