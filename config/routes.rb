Rails.application.routes.draw do
  namespace :dejavu_api, defaults: { format: :json } do
    resources :services, except: [:put]
  end
end
