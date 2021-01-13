Rails.application.routes.draw do
  root to: 'users#show'

  devise_for :users, path: 'member', path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :users, only: [:index, :show] do
    resource :friendship, only: [:create, :update, :destroy]
  end
  resources :posts, except: [:show, :new] do
    #resources :comments, only: [:create, :destroy]
    post 'like', on: :member
    delete 'unlike', on: :member
  end
  resources :comments, only: [:index, :create, :destroy] do
    post 'like', on: :member
    delete 'unlike', on: :member
  end
end
