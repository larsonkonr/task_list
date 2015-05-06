Rails.application.routes.draw do
  root 'lists#index'
  resources :list
  resources :task
end
