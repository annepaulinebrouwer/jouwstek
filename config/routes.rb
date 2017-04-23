Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#home'
  
  resources :gardens do
    resources :garden_participations, only: [:create, :destroy]
    resources :garden_locations, except: [:index, :show]
    resources :requests, only: [:new, :create]
    resources :posts, except: [:show, :index, :new]

    resources :harvests, except: [:show, :index] do
      resources :crops, except: [:show, :index]
    end
  end

  resource :dashboard, only: [:show]

  namespace :dashboard do
    resources :requests, only: [:index, :show, :edit, :update] do
      member do
        patch :confirm
        patch :cancel
      end
    end
  end
end
