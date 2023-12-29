Rails.application.routes.draw do
  root "records#index"
  resources :records, only: [:index, :create, :show]
end
