Rails.application.routes.draw do
  namespace :api do
    resources :videos, only: [:index] do
    end
  end
end
