Rails.application.routes.draw do
  namespace :dejavu_api, defaults: { format: :json } do
    resources :services
    resources :technicians
  end
end
