Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  unauthenticated do
    root to: 'splash#index', as: :unauthenticated_root
  end
  devise_for :users
  resources :categories
  resources :transactions
end
