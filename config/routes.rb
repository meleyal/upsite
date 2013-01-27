Sitespot::Application.routes.draw do

  resources :sites

  constraints :subdomain => /.+/ do
    match '/' => 'sites#show'
    resources :widgets, except: [:new, :edit]
    resources :texts, except: [:new, :edit]
    resources :images, except: [:new, :edit]
    resources :attachments, except: [:new, :edit]
  end

  root :to => 'sites#index'

end
