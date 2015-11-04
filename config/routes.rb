Rails.application.routes.draw do
  root to: 'solar_resources#search'

  post '/location', to: "solar_resources#show"
end
