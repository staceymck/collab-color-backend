Rails.application.routes.draw do
  root 'canvases#index'
  resources :paintings
  resources :canvases
end
