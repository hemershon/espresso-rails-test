# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :users
    resources :cards do
      resources :expenses
    end
  end

  root to: 'home#index'
  post '/api/baas/webhooks', to: 'webhooks#receive'
end
