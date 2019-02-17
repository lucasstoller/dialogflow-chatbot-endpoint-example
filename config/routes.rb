Rails.application.routes.draw do
  resources :consultas

  root "consultas#index"
end
