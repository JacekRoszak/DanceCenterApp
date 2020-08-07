Rails.application.routes.draw do
  resources :contracts
  resources :posts
  resources :payments
  resources :options
  resources :events
  devise_for :users
  root 'posts#index'
  scope "/admin" do
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
