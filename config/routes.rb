require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end

  resources :links, only: [:new, :create, :edit, :update, :show, :destroy]

  root to: "dashboard#index"

  get "/*path" => "redirect#show"
end
