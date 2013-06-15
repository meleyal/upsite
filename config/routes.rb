Pagekit::Application.routes.draw do

  constraints :subdomain => /.+/ do
    get '/' => 'sites#show'
    put '/' => 'sites#update'
    # resources :sites, only: [:show, :update], :path => '/'
    resources :widgets, except: [:new, :edit]
    resources :attachments, except: [:new, :edit]
    # resources :attachments, only: [:create]
  end

  root :to => 'static_pages#home'

end
