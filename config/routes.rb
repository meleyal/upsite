Sitespot::Application.routes.draw do

  # resources :sites

  constraints :subdomain => /.+/ do
    get '/' => 'sites#show'
    put '/' => 'sites#update'
    resources :widgets, except: [:new, :edit]
    # resources :attachments, except: [:new, :edit]
    resources :attachments, only: [:create]
  end

  # root :to => 'sites#index'

end
