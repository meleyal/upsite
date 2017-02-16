Rails.application.routes.draw do

  constraints :subdomain => /^(?!www\Z)(\w+)/ do
    get '/' => 'sites#show'
    get 'settings/:group' => 'settings#edit', as: 'settings',
      constraints: { group: /site|account|user|sites|invites/ }
    patch 'settings/:group' => 'settings#update'
    get 'edit' => 'sites#edit'
    patch 'edit' => 'sites#update'
    get 'sites/new' => 'sites#new', as: :new_site
    post 'sites' => 'sites#create'
    delete 'sites/:id' => 'sites#destroy', as: :destroy_site
    get 'invites/new' => 'invites#new', as: :new_invite
    post 'invites' => 'invites#create'
    resources :help, only: [:new, :create]
    resources :blocks do
      post 'sort', on: :collection
      resources :attachments
    end
  end

  # HACK: Uncomment to test Stripe webhooks via http://upsite.ngrok.io
  # constraints :subdomain => /^(upsite)/ do
  constraints :subdomain => /^(www)/ do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'signup', to: 'signups#new'
    get 'signup/:token', to: 'signups#new', as: :signup_via_invite
    post 'signup/:token', to: 'signups#create'
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
    root 'website#index'
  end

end
