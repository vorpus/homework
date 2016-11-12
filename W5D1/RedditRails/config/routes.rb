Rails.application.routes.draw do
  resources :users, only: [:create, :new]

  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    resource :posts, only: [:new]
  end

  resources :posts, except: [:new, :index] do
    resources :comments, only: [:new]
    resources :votes, only: [:create]
  end

  resources :comments, only: [:create, :show] do
    resources :votes, only: [:create]
  end



  root :to => 'subs#index'
end
