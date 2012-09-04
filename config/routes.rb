Sitespot::Application.routes.draw do

  # resources :widgets
  resources :sites

  constraints :subdomain => /.+/ do
    match '/' => 'sites#show'
    resources :widgets
    resources :texts
  end

  root :to => 'sites#index'

end
