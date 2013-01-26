Sitespot::Application.routes.draw do

  resources :sites

  constraints :subdomain => /.+/ do
    match '/' => 'sites#show'
    resources :widgets
    resources :texts
    resources :images
    resources :attachments
  end

  root :to => 'sites#index'

end
