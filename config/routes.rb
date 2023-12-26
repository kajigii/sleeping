Rails.application.routes.draw do
  get 'records/index'
  

  
  root "records#index"
end
