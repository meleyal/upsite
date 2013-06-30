Pagekit::Application.routes.draw do

  resources :signups, only: [:new]

  if Rails.env.development?

    constraints :subdomain => /^(?!www\Z)(\w+)/ do
      get '/' => 'pages#show'
      put '/' => 'pages#update'
      # resources :pages, only: [:show, :update], :path => '/'
      resources :widgets, except: [:new, :edit]
      resources :attachments, except: [:new, :edit]
      # resources :attachments, only: [:create]
    end

  end

  root :to => 'signups#new'

end
