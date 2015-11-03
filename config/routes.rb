Rails.application.routes.draw do
  resource :solar_resources, only: [:index]
  root to: 'solar_resources#index'
end
