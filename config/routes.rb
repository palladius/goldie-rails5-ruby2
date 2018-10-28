Rails.application.routes.draw do
  resources :gce_zones
  resources :gce_regions
  get 'welcome/about'
  get 'welcome/index'
  get 'welcome/license'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :just_routes

end
