Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: 'auth'
  
  namespace :api do
    namespace :v1 do
      resources :groups do
        resources :posts
        member do
          post 'join'
          delete 'leave'
        end
      end
      resources :users, only: [:show, :update]
    end
  end
end 