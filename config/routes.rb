Rails.application.routes.draw do
  root to: "departments#index"

  resources :employees
  resources :departments
end
