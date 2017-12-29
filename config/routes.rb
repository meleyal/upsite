Rails.application.routes.draw do

  constraints :subdomain => /^(?!www\Z)(\w+)/ do
    get '/' => 'sites#show'
    get 'settings/:group' => 'settings#edit', as: 'settings',
      constraints: { group: /site|user|sites|invites/ }
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
    end
  end

  constraints :subdomain => /^(www)/ do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'forgot-password', to: 'password_resets#new', as: :new_password_reset
    post 'forgot-password', to: 'password_resets#create', as: :password_resets
    get 'reset-password/:id', to: 'password_resets#edit', as: :edit_password_reset
    patch 'reset-password/:id', to: 'password_resets#update', as: :password_reset
    get 'signup', to: 'signups#new'
    get 'signup/:token', to: 'signups#new', as: :signup_via_invite
    post 'signup/:token', to: 'signups#create'
    get 'cancel', to: 'signups#cancel'
    delete 'cancel', to: 'signups#destroy'
    get 'terms', to: redirect('/legal')
    get 'privacy', to: redirect('/legal')
    get 'legal', to: 'website#legal'
    root 'website#index'
  end

end
