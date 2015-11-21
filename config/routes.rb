Rails.application.routes.draw do

  if Rails.env.development?
    resources :sites, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

    # get '/signup', to: 'sites#new'
    # constraints plan: /(free|pro)/ do
    #   get  '/signup/:plan',           to: 'signups#new',    as: :signup
    #   post '/signup/:plan',           to: 'signups#create', as: :signup_post
    #   get  '/signup/:plan/complete',  to: 'signups#show',   as: :signup_complete
    # end
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

  get '/signup', to: 'signups#new'
  get '/signup/complete', to: 'signups#show'
  get '/terms', to: 'website#terms'
  get '/privacy', to: 'website#privacy'
  root 'website#index'

end
