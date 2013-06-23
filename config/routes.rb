Pagekit::Application.routes.draw do

  resources :signups, only: [:new, :create]

  # constraints :subdomain => /.+/ do
  #   get '/' => 'pages#show'
  #   put '/' => 'pages#update'
  #   # resources :pages, only: [:show, :update], :path => '/'
  #   resources :widgets, except: [:new, :edit]
  #   resources :attachments, except: [:new, :edit]
  #   # resources :attachments, only: [:create]
  # end

  root :to => 'signups#new'

end
