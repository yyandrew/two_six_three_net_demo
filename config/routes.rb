Rails.application.routes.draw do
  root to: "departments#index"

  resources :departments
end
