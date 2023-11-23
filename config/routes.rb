Rails.application.routes.draw do
  root to: 'visitor#index'
  resources :articles, only: [:show] 
  devise_for :users
  namespace :me do 
    resources :articles do
      resources :comments, shallow: true do
        post :create_reply
        member do
          get :init_reply
        end
      end

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
