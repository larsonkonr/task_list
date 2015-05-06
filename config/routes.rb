Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
    resources :tasks do
      member do
        post 'toggle'
      end
    end
  end
end
