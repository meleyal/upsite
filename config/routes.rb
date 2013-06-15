Pagekit::Application.routes.draw do

  constraints :subdomain => /.+/ do
    get '/' => 'pages#show'
    put '/' => 'pages#update'
    # resources :pages, only: [:show, :update], :path => '/'
    resources :widgets, except: [:new, :edit]
    resources :attachments, except: [:new, :edit]
    # resources :attachments, only: [:create]
  end

  # root :to => 'static_pages#home'

end
