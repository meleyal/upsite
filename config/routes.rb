Rails.application.routes.draw do

  if Rails.env.development?
    resources :sites, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

    get '/signup', to: 'sites#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    constraints :subdomain => /^(?!www\Z)(\w+)/ do
    # constraints(:subdomain => /.+/) do
      get '/' => 'sites#show'

      get 'settings/design' => 'design#edit'
      patch 'settings/design' => 'design#update'

      get 'settings/account' => 'account#edit'
      patch 'settings/account' => 'account#update'

      resources :help, only: [:new, :create]

      resources :blocks do
        resources :attachments, except: [:new, :edit], defaults: { format: 'json' }
      end
    end
  end

  root 'signups#new'

end
