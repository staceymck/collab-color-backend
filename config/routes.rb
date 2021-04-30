Rails.application.routes.draw do
  resources :colored_polygons
  resources :paintings
  resources :polygons
  resources :canvases
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
